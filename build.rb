#!/usr/bin/env ruby -wU
CONSTANTS = {
  'PYTHON_VERSION' => '3.8.12',
  'PYTHON_CHECKER_URL' => 'https://raw.githubusercontent.com/lewagon/data-setup/master/checks/python_checker.sh',
  'PIP_CHECKER_URL' => 'https://raw.githubusercontent.com/lewagon/data-setup/master/checks/pip_check.sh',
  'PIP_LOADER_URL' => 'https://raw.githubusercontent.com/lewagon/data-setup/master/checks/pip_check.py',
  'CODE_EDITOR' => 'VS Code',
  'CODE_EDITOR_CMD' => 'code'
}

# NOTE(ssaunier): This script needs https://github.com/lewagon/setup to be cloned as well
MAC_OS = %w[
  intro
  setup/zoom
  setup/github
  setup/macos_apple_silicon
  setup/macos_command_line_tools
  homebrew
  chrome
  setup/macos_vscode
  vscode_extensions
  setup/vscode_liveshare
  setup/oh_my_zsh
  setup/gh_cli
  setup/ssh_key
  dotfiles
  dotfiles_new_student
  dotfiles_new_laptop
  dotfiles_new_laptop_heading
  dotfiles_new_laptop
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
  setup/kitt
  setup/macos_slack
  setup/slack_settings
  kata
].freeze

MAC_OS_KC = %w[
  keep_current
  python_checkup
].freeze

WINDOWS = %w[
  intro
  setup/zoom
  setup/github
  setup/windows_version
  setup/windows_virtualization
  setup/windows_wsl
  setup/windows_ubuntu
  chrome
  setup/windows_vscode
  setup/windows_terminal
  vscode_extensions
  setup/vscode_liveshare
  setup/git
  setup/zsh
  setup/oh_my_zsh
  setup/gh_cli
  setup/ssh_key
  ubuntu_gcloud
  dotfiles
  dotfiles_new_student
  dotfiles_new_laptop
  dotfiles_new_laptop_heading
  dotfiles_new_laptop
  setup/ssh_agent
  ubuntu_python
  virtualenv
  pip
  win_jupyter
  nbextensions
  python_checkup
  dbeaver
  setup/windows_settings
  win_vs_redistributable
  win_docker
  gcp_setup
  gcp_setup_wsl
  gcp_setup_end
  setup/kitt
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
  setup/zoom
  setup/github
  setup/ubuntu_vscode
  vscode_extensions
  setup/vscode_liveshare
  setup/git
  chrome
  setup/zsh
  setup/oh_my_zsh
  setup/gh_cli
  setup/ssh_key
  ubuntu_gcloud
  dotfiles
  dotfiles_new_student
  dotfiles_new_laptop
  dotfiles_new_laptop_heading
  dotfiles_new_laptop
  setup/ssh_agent
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
  setup/kitt
  setup/ubuntu_slack
  setup/slack_settings
  kata
]

LINUX_KC = %w[
  keep_current
  python_checkup
]

filenames = {
  "WINDOWS" => ["WINDOWS", WINDOWS],
  "macOS" => ["macOS", MAC_OS],
  "LINUX" => ["LINUX", LINUX],
  "WINDOWS_keep_current" => ["WINDOWS", WINDOWS_KC],
  "macOS_keep_current" => ["macOS", MAC_OS_KC],
  "LINUX_keep_current" => ["LINUX", LINUX_KC]
}

delimiters = {
  "WINDOWS" => ["\\$WINDOWS_START\n", "\\$WINDOWS_END\n"],
  "macOS" => ["\\$MAC_START\n", "\\$MAC_END\n"],
  "LINUX" => ["\\$LINUX_START\n", "\\$LINUX_END\n"]
}

def load_partial(partial)
  match_data = partial.match(/setup\/(?<partial>[0-9a-z_]+)/)
  if match_data
    require 'open-uri'
    content = URI.open(File.join("https://raw.githubusercontent.com/lewagon/setup/master", "_partials", "#{match_data[:partial]}.md"))
            .string
    # replace data-setup repo relative path by setup repo URL
    image_paths = content.scan(/\!\[.*\]\((.*)\)/).flatten
    image_paths.each { |ip| content.gsub!(ip, "https://github.com/lewagon/setup/blob/master/#{ip}")}
  else
    file = File.join("_partials", "#{partial}.md")
    content = File.read(file, encoding: "utf-8")
  end
  content
end

# load partials
loaded = filenames.map { |os, (os_name, partials)| partials }.flatten.uniq
loaded = loaded.map { |partial| [partial, load_partial(partial)] }.to_h

# write files
[""].each do |locale|
  filenames.each do |filename, (os_name, partials)|
    filename += ".#{locale}" unless locale.empty?
    filename += ".md"
    File.open(filename, "w:utf-8") do |f|
      partials.each do |partial|
        content = loaded[partial].clone
        # remove the OS dependant blocks
        removed_blocks = delimiters.keys - [os_name]
        removed_blocks.each do |block|
          delimiter_start, delimiter_end = delimiters[block]
          pattern = "#{delimiter_start}(.|\n)*?(?<!#{delimiter_end})#{delimiter_end}"
          content.gsub!(/#{pattern}/, "")
        end
        # remove the OS dependant block delimiters
        delimiters[os_name].each do |delimiter|
          content.gsub!(/#{delimiter}/, "")
        end
        CONSTANTS.each do |placeholder, value|
          content.gsub!("<#{placeholder}>", value)
        end
        f << content
        f << "\n\n"
      end
    end
  end
end
