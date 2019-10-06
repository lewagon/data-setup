#!/usr/bin/env ruby -wU

WINDOWS = %w[setup_instructions win_anaconda win_sublime win_github win_git_bash win_sublime_package win_make win_alumni win_slack].freeze
MAC_OS = %w[setup_instructions setup/osx_command_line_tools setup/github homebrew setup/osx_sublime_text setup/osx_oh_my_zsh setup/github_rsa osx_anaconda setup/dotfiles setup/ssh_osx win_alumni].freeze

filenames = {
  'WINDOWS.md' => WINDOWS,
  'macOS.md' => MAC_OS
}

filenames.each do |filename, partials|
  File.open(filename.to_s, 'w:utf-8') do |f|
    partials.each do |partial|
      match_data = partial.match(/setup\/(?<partial>[a-z_]+)/)
      file = match_data ? File.join('../setup', '_partials', "#{match_data[:partial]}.md") : File.join('_partials', "#{partial}.md")
      f << File.read(file, encoding: 'utf-8')
      f << "\n\n"
    end
  end
end
