#!/usr/bin/env ruby -wU

PYTHON_VERSION = "3.8.6"

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

filenames = {
  "WINDOWS.md" => WINDOWS,
  "macOS.md" => MAC_OS,
  "LINUX.md" => LINUX,
}

DEFAULT_SUBS = {
  "<CODE_EDITOR>" => "VS Code",
  "<CODE_EDITOR_CMD>" => "code"
}

subs = {
  "WINDOWS.md" => DEFAULT_SUBS,
  "macOS.md" => DEFAULT_SUBS,
  "LINUX.md" => DEFAULT_SUBS,
}

delimiters = {
  "WINDOWS.md" => ["\\$WINDOWS_START\n", "\\$WINDOWS_END\n"],
  "macOS.md" => ["\\$MAC_START\n", "\\$MAC_END\n"],
  "LINUX.md" => ["\\$LINUX_START\n", "\\$LINUX_END\n"],
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
      # iterate through the patterns to replace in the file depending on the OS
      subs[filename].each do |pattern, replace|
        content.gsub!(pattern, replace)
      end
      # remove the OS dependant blocks
      removed_blocks = delimiters.keys - [filename]
      removed_blocks.each do |block|
        delimiter_start, delimiter_end = delimiters[block]
        pattern = "#{delimiter_start}(.|\n)*?(?<!#{delimiter_end})#{delimiter_end}"
        content.gsub!(/#{pattern}/, "")
      end
      # remove the OS dependant block delimiters
      delimiters[filename].each do |delimiter|
        content.gsub!(/#{delimiter}/, "")
      end
      f << content.gsub("<PYTHON_VERSION>", PYTHON_VERSION)
      f << "\n\n"
    end
  end
end
