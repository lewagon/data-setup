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
  setup/ssh_osx
  osx_python
  osx_virtualenv
  pip
  docker
  alumni
  setup/osx_slack
].freeze

WINDOWS = %w[
  setup_instructions
  setup/remote_tools
  win_sublime
  win_github_account
  win_git
  win_github
  win_python
  win_virtualenv
  pip
  win_sublime_package
  win_make
  docker
  alumni
  win_slack
].freeze

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
      file = match_data ? File.join("../setup", "_partials", "#{match_data[:partial]}.md") : File.join("_partials", "#{partial}.md")
      f << File.read(file, encoding: "utf-8").gsub("<PYTHON_VERSION>", PYTHON_VERSION)
      f << "\n\n"
    end
  end
end
