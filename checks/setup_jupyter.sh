#!/bin/bash

# Setup Jupyter script for macOS, Ubuntu, and Ubuntu on WSL
# This script:
# 1. Checks if Jupyter is properly installed
# 2. Sets up custom CSS for Jupyter notebooks
# 3. Configures browser settings (WSL only)
# 4. Generates and configures Jupyter notebook config

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to detect if running on WSL
is_wsl() {
  grep -qi microsoft /proc/version 2>/dev/null || grep -qi wsl /proc/version 2>/dev/null
  return $?
}

# Function to print messages
print_status() {
  echo -e "${GREEN}✓${NC} $1"
}

print_error() {
  echo -e "${RED}✗${NC} $1"
}

print_info() {
  echo -e "${YELLOW}ℹ${NC} $1"
}

echo "========================================"
echo "Jupyter Setup Script"
echo "========================================"
echo ""

# Step 1: Check if Jupyter is installed
print_info "Checking if Jupyter is properly installed..."

if ! command -v jupyter &> /dev/null; then
  print_error "Jupyter is not installed"
  echo "Please try to install the Python dependencies again"
  echo "If the problem persists, ask a TA for help"
  exit 1
fi

print_status "Jupyter is installed"

# Verify jupyter can be executed
if ! jupyter --config-dir &> /dev/null; then
  print_error "Jupyter is installed but appears to be misconfigured"
  exit 1
fi

print_status "Jupyter is properly configured"
echo ""

# Step 2: Set up custom CSS for notebooks
print_info "Setting up custom CSS for Jupyter notebooks..."

LOCATION=$(jupyter --config-dir)/custom
SOURCE="https://raw.githubusercontent.com/lewagon/data-setup/refs/heads/master/specs/jupyter/custom.css"

# Create the custom directory
mkdir -p "$LOCATION"

# Download and setup custom CSS
if curl -sf "$SOURCE" > "$LOCATION/custom.css"; then
  print_status "Custom CSS installed to $LOCATION/custom.css"
else
  print_error "Failed to download custom CSS from $SOURCE"
  exit 1
fi

echo ""

# Step 3: WSL-specific browser configuration
if is_wsl; then
  print_info "WSL detected - configuring browser settings..."

  # Configure default browser
  BROWSER_CONFIGURED=false

  if [ -f ~/.zshrc.backup ]; then
    if grep -E "export (GH_)*BROWSER" ~/.zshrc.backup >> ~/.zshrc 2>/dev/null; then
      print_status "Browser settings added to .zshrc"
      BROWSER_CONFIGURED=true
    fi
  fi

  # If browser not configured, use fallback script
  if [ "$BROWSER_CONFIGURED" = false ]; then
    print_info "Attempting to configure browser using wslsetbrowser..."

    FALLBACK_SCRIPT=$(mktemp)
    if curl -sf "https://raw.githubusercontent.com/julesvanrie/wslsetbrowser/refs/heads/main/wslsetbrowser.sh" > "$FALLBACK_SCRIPT"; then
      if bash "$FALLBACK_SCRIPT"; then
        print_status "Browser configured via wslsetbrowser"
        BROWSER_CONFIGURED=true
      else
        print_error "wslsetbrowser script failed"
      fi
    else
      print_error "Failed to download wslsetbrowser script"
    fi
    rm -f "$FALLBACK_SCRIPT"
  fi

  echo ""
  print_info "Generating Jupyter Notebook configuration..."

  # Generate Jupyter config
  jupyter notebook --generate-config

  # Configure Jupyter with WSL-specific settings
  CONFIG_FILE=~/.jupyter/jupyter_notebook_config.py
  WSL_CONFIG_SOURCE="https://raw.githubusercontent.com/lewagon/data-setup/refs/heads/master/specs/jupyter/wsl_redirect.py"

  if [ -f "$CONFIG_FILE" ]; then
    # Backup the original config
    cp "$CONFIG_FILE" "$CONFIG_FILE.backup"

    # Download and append WSL configuration
    WSL_CONFIG=$(mktemp)
    if curl -sf "$WSL_CONFIG_SOURCE" > "$WSL_CONFIG"; then
      echo "" >> "$CONFIG_FILE"
      cat "$WSL_CONFIG" >> "$CONFIG_FILE"
      print_status "Jupyter configured for WSL with browser settings"
    else
      print_error "Failed to download WSL configuration from $WSL_CONFIG_SOURCE"
      exit 1
    fi
    rm -f "$WSL_CONFIG"
  else
    print_error "Jupyter configuration file not found at $CONFIG_FILE"
    exit 1
  fi
fi

echo ""
echo "========================================"
print_status "Jupyter setup complete!"
echo "========================================"
echo ""
echo "Restart your shell with 'exec zsh'"
echo ""
