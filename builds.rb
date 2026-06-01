
CONSTANTS = {
  'PYTHON_VERSION' => '3.12.9',
  'PYTHON_CHECKER_URL' => 'https://raw.githubusercontent.com/lewagon/data-setup/master/checks/python_checker.sh',
  'PIP_CHECKER_URL' => 'https://raw.githubusercontent.com/lewagon/data-setup/master/checks/pip_check.sh',
  'PIP_LOADER_URL' => 'https://raw.githubusercontent.com/lewagon/data-setup/master/checks/pip_check.py',
  'CODE_EDITOR' => 'VS Code',
  'CODE_EDITOR_CMD' => 'code'
}

# NOTE(ssaunier): This script needs https://github.com/lewagon/setup to be cloned as well
MAC_OS = %w[
  intro
  setup/github
  osx_silicon
  setup/macos_command_line_tools
  homebrew
  setup/macos_vscode
  vscode_extensions
  setup/vscode_aifeatures
  setup/oh_my_zsh
  direnv
  setup/gh_cli
  dotfiles
  dotfiles_new_student
  dotfiles_new_laptop
  dotfiles_merge_upstream
  dotfiles_same_laptop
  dotfiles_merge_upstream
  dotfiles_installer
  conda_uninstall
  osx_python
  virtualenv
  pip
  nbextensions
  python_checkup
  dbeaver
  docker
  gcp_cli_setup
  gcp_setup
  gcp_setup_mid
  gcp_setup_end
  kitt
  setup/macos_slack
  setup/slack_settings
  setup/macos_settings
  kata
].freeze

MAC_OS_KC = %w[
  keep_current
  python_checkup
].freeze

WINDOWS = %w[
  intro
  setup/github
  setup/windows_version
  setup/windows_virtualization
  setup/windows_wsl
  setup/windows_ubuntu
  setup/windows_vscode
  setup/windows_terminal
  vscode_extensions
  setup/vscode_aifeatures
  setup/cli_tools
  setup/oh_my_zsh
  windows_browser
  direnv
  setup/gh_cli
  ubuntu_gcloud
  dotfiles
  dotfiles_new_student
  dotfiles_new_laptop
  dotfiles_merge_upstream
  dotfiles_same_laptop
  dotfiles_merge_upstream
  dotfiles_installer
  setup/ssh_agent
  conda_uninstall
  ubuntu_python
  virtualenv
  pip
  nbextensions
  win_jupyter
  python_checkup
  dbeaver
  setup/windows_settings
  win_vs_redistributable
  win_docker
  gcp_setup
  gcp_setup_wsl
  gcp_setup_end
  kitt
  setup/windows_slack
  setup/slack_settings
  kata
].freeze

WINDOWS_KC = %w[
  keep_current
  python_checkup
].freeze

LINUX = %w[
  intro
  setup/github
  setup/ubuntu_vscode
  vscode_extensions
  setup/vscode_aifeatures
  setup/cli_tools
  setup/oh_my_zsh
  direnv
  setup/gh_cli
  ubuntu_gcloud
  dotfiles
  dotfiles_new_student
  dotfiles_new_laptop
  dotfiles_merge_upstream
  dotfiles_same_laptop
  dotfiles_merge_upstream
  dotfiles_installer
  setup/ssh_agent
  conda_uninstall
  ubuntu_python
  virtualenv
  pip
  nbextensions
  python_checkup
  dbeaver
  ubuntu_docker
  gcp_setup
  gcp_setup_linux
  gcp_setup_end
  kitt
  setup/ubuntu_slack
  setup/slack_settings
  kata
].freeze

LINUX_KC = %w[
  keep_current
  python_checkup
].freeze

# student installs vscode, creates gcp vm, runs setup on vm
VM = %w[
  intro
  setup/github
  de_setup/ssh_key
  de_setup/gcp_setup
  de_setup/virtual_machine
  de_setup/win_vscode
  de_setup/vscode_remote_ssh
  vscode_extensions
  setup/vscode_aifeatures
  setup/cli_tools
  setup/oh_my_zsh
  direnv
  setup/gh_cli
  de_setup/ubuntu_gcloud
  de_setup/gcp_setup_linux
  dotfiles
  dotfiles_new_student
  dotfiles_new_laptop
  dotfiles_merge_upstream
  dotfiles_same_laptop
  dotfiles_merge_upstream
  dotfiles_installer
  de_setup/zsh_default_terminal
  setup/ssh_agent
  ubuntu_python
  virtualenv
  pip
  nbextensions
  python_checkup
  dbeaver
  ubuntu_docker
  kitt
  setup/windows_slack
  setup/slack_settings
  kata
].freeze

# student installs vscode, redeems vm provided by lewagon, runs setup on vm
REMOTE_SETUP = %w[
  intro
  setup/github
  de_setup/ssh_key
  vm_register
  vm_start
  vm_test
  de_setup/win_vscode
  de_setup/vscode_remote_ssh
  vscode_extensions
  setup/vscode_aifeatures
  setup/cli_tools
  setup/oh_my_zsh
  direnv
  setup/gh_cli
  #de_setup/ubuntu_gcloud
  #de_setup/gcp_setup_linux
  dotfiles
  dotfiles_new_student
  dotfiles_new_laptop
  dotfiles_merge_upstream
  dotfiles_same_laptop
  dotfiles_merge_upstream
  dotfiles_installer
  de_setup/zsh_default_terminal
  setup/ssh_agent
  ubuntu_python
  virtualenv
  pip
  nbextensions
  python_checkup
  dbeaver
  ubuntu_docker
  #de_setup/gcp_setup
  #kitt
  #setup/windows_slack
  #setup/slack_settings
  #kata
  vm_stop
  end
].freeze

LOCALES = ['', 'es'].freeze  # english + spanish locales
ENGLISH_ONLY = %w[REMOTE_SETUP].freeze

# Maps output filename to its OS target (for conditional block filtering) and partial list.
# Entries prefixed with "#" in a partial list are skipped (used to document excluded steps).
BUILDS = {
  'WINDOWS'              => { os: 'WINDOWS', partials: WINDOWS },
  'macOS'                => { os: 'macOS',   partials: MAC_OS },
  'LINUX'                => { os: 'LINUX',   partials: LINUX },
  'WINDOWS_keep_current' => { os: 'WINDOWS', partials: WINDOWS_KC },
  'macOS_keep_current'   => { os: 'macOS',   partials: MAC_OS_KC },
  'LINUX_keep_current'   => { os: 'LINUX',   partials: LINUX_KC },
  'VM'                   => { os: 'LINUX',   partials: VM },
  'REMOTE_SETUP'         => { os: 'LINUX',   partials: REMOTE_SETUP },
}

DELIMITERS = {
  'WINDOWS' => ["\\$WINDOWS_START\n", "\\$WINDOWS_END\n"],
  'macOS'   => ["\\$MAC_START\n",     "\\$MAC_END\n"],
  'LINUX'   => ["\\$LINUX_START\n",   "\\$LINUX_END\n"],
}
