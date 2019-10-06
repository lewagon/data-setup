#!/usr/bin/env ruby -wU

WINDOWS = %w[setup_instructions win_anaconda win_sublime win_git_bash win_make win_github win_alumni win_slack].freeze
# MAC_OS = %w[setup/intro osx_command_line_tools github homebrew osx_sublime_text osx_oh_my_zsh github_rsa dotfiles ssh_osx rbenv_osx rbenv_ruby osx_postgresql osx_security checkup alumni_platform osx_slack osx_preferencesosx_command_line_tools github homebrew osx_sublime_text osx_oh_my_zsh github_rsa dotfiles ssh_osx rbenv_osx rbenv_ruby osx_postgresql osx_security checkup alumni_platform osx_slack osx_preferences].freeze
MAC_OS = %w[setup/intro].freeze

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
