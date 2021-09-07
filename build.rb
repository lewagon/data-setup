#!/usr/bin/env ruby -wU
CONSTANTS = {
    'PYTHON_VERSION' => "3.9.6",
    'REQUIREMENTS_URL' => "https://raw.githubusercontent.com/lewagon/data-runner/py-3.9.6-pandas-1.3/requirements.txt",
    'PYTHON_VERSION_URL' => "https://raw.githubusercontent.com/lewagon/data-setup/master/python_version.txt",
    'PYTHON_CHECKER_URL' => "https://raw.githubusercontent.com/lewagon/data-setup/master/checks/python_checker.sh",
    'PIP_CHECKER_URL' => "https://raw.githubusercontent.com/lewagon/data-setup/master/checks/pip_check.sh",
    'PIP_LOADER_URL' => "https://raw.githubusercontent.com/lewagon/data-setup/master/checks/pip_check.py"
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
  github_rsa
  setup/gh_cli
  dotfiles
  osx_python
  virtualenv
  pip
  python_checkup
  nbextensions
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
  vscode_extensions
  setup/vscode_liveshare
  setup/windows_terminal
  setup/git
  setup/zsh
  setup/oh_my_zsh
  github_rsa
  setup/windows_browser
  setup/gh_cli
  ubuntu_gcloud
  dotfiles
  setup/windows_ssh
  ubuntu_python
  virtualenv
  pip
  python_checkup
  win_jupyter
  nbextensions
  setup/windows_settings
  win_vs_redistributable
  ubuntu_docker
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
  github_rsa
  setup/gh_cli
  ubuntu_gcloud
  dotfiles
  ubuntu_python
  virtualenv
  pip
  python_checkup
  nbextensions
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

KEEP_CURRENT_SUFFIX = "_keep_current"

filenames = {
  "WINDOWS.md" => WINDOWS,
  "macOS.md" => MAC_OS,
  "LINUX.md" => LINUX,
  "WINDOWS#{KEEP_CURRENT_SUFFIX}.md" => WINDOWS_KC,
  "macOS#{KEEP_CURRENT_SUFFIX}.md" => MAC_OS_KC,
  "LINUX#{KEEP_CURRENT_SUFFIX}.md" => LINUX_KC
}

DEFAULT_SUBS = {
  "<CODE_EDITOR>" => "VS Code",
  "<CODE_EDITOR_CMD>" => "code"
}

subs = {
  "WINDOWS.md" => DEFAULT_SUBS,
  "macOS.md" => DEFAULT_SUBS,
  "LINUX.md" => DEFAULT_SUBS
}

delimiters = {
  "WINDOWS.md" => ["\\$WINDOWS_START\n", "\\$WINDOWS_END\n"],
  "macOS.md" => ["\\$MAC_START\n", "\\$MAC_END\n"],
  "LINUX.md" => ["\\$LINUX_START\n", "\\$LINUX_END\n"]
}

filenames.each do |filename, partials|
  File.open(filename.to_s, "w:utf-8") do |f|
    partials.each do |partial|
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
      # retrieve os name
      if filename.include? KEEP_CURRENT_SUFFIX
          os_name = filename[0..-(KEEP_CURRENT_SUFFIX.length() + 4)] + ".md"
      else
          os_name = filename
      end
      # iterate through the patterns to replace in the file depending on the OS
      subs[os_name].each do |pattern, replace|
        content.gsub!(pattern, replace)
      end
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
