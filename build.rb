#!/usr/bin/env ruby -wU

PYTHON_VERSION = "3.7.7"

# NOTE(ssaunier): This script needs https://github.com/lewagon/setup to be cloned as well
MAC_OS = %w[
  setup_instructions
  setup/remote_tools
  setup/osx_command_line_tools
  setup/github
  homebrew
  setup/osx_sublime_text
  setup/osx_oh_my_zsh
  github_rsa
  dotfiles
  ssh_osx
  osx_python
  osx_virtualenv
  pip
  docker
  alumni
  setup/osx_slack
  kata
].freeze

# WINDOWS = %w[
#   setup_instructions
#   setup/remote_tools
#   win_sublime
#   win_github_account
#   win_git
#   win_github
#   win_python
#   win_virtualenv
#   pip
#   win_sublime_package
#   win_make
#   win_extra
#   win_docker
#   alumni
#   win_slack
#   kata
# ].freeze

WINDOWS = %w[setup_instructions
  wsl2_prereq_intro
  wsl2_prereq_win10
  wsl2_prereq_win_version
  wsl2_prereq_virtualization
  wsl2_github
  wsl2_remote_tools
  wsl2_install_wsl
  wsl2_vscode
  wsl2_windows_terminal
  wsl2_git
  wsl2_oh_my_zsh
  github_rsa
  wsl2_nodejs
  wsl2_dotfiles
  wsl2_browser_variable
  dotfiles
  ubuntu_python
  osx_virtualenv
  pip
  ubuntu_docker
  setup/ubuntu_inotify
  setup/ubuntu_extra
  alumni
  setup/ubuntu_slack
  kata].freeze

LINUX = %w[
  setup_instructions
  setup/remote_tools
  setup/github
  setup/ubuntu_git
  setup/ubuntu_sublime_text
  ubuntu_oh_my_zsh
  github_rsa
  dotfiles
  ubuntu_python
  osx_virtualenv
  pip
  ubuntu_docker
  setup/ubuntu_inotify
  setup/ubuntu_extra
  alumni
  setup/ubuntu_slack
  kata
]

filenames = {
  "WINDOWS.md" => WINDOWS,
  "macOS.md" => MAC_OS,
  "LINUX.md" => LINUX,
}

filenames.each do |filename, partials|
  File.open(filename.to_s, "w:utf-8") do |f|
    partials.each do |partial|
      match_data = partial.match(/setup\/(?<partial>[a-z_]+)/)
      if match_data
        require 'open-uri'
        f << URI.open(File.join("https://raw.githubusercontent.com/lewagon/setup/master", "_partials", "#{match_data[:partial]}.md"))
                .string
                .gsub("<PYTHON_VERSION>", PYTHON_VERSION)
      else
        file = File.join("_partials", "#{partial}.md")
        f << File.read(file, encoding: "utf-8").gsub("<PYTHON_VERSION>", PYTHON_VERSION)
      end
      f << "\n\n"
    end
  end
end
