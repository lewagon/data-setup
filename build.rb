#!/usr/bin/env ruby -wU

require 'open-uri'
require 'liquid'

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
]

LINUX_KC = %w[
  keep_current
  python_checkup
]

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
]

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
]

LOCALES = ["", "es"]  # english + spanish locales
ENGLISH_ONLY = %w[REMOTE_SETUP].freeze

# Maps output filename to its OS target (for conditional block filtering) and partial list.
# Entries prefixed with "#" in a partial list are skipped (used to document excluded steps).
BUILDS = {
  "WINDOWS"              => { os: "WINDOWS", partials: WINDOWS },
  "macOS"                => { os: "macOS",   partials: MAC_OS },
  "LINUX"                => { os: "LINUX",   partials: LINUX },
  "WINDOWS_keep_current" => { os: "WINDOWS", partials: WINDOWS_KC },
  "macOS_keep_current"   => { os: "macOS",   partials: MAC_OS_KC },
  "LINUX_keep_current"   => { os: "LINUX",   partials: LINUX_KC },
  "VM"                   => { os: "LINUX",   partials: VM },
  "REMOTE_SETUP"         => { os: "LINUX",   partials: REMOTE_SETUP },
}

DELIMITERS = {
  "WINDOWS" => ["\\$WINDOWS_START\n", "\\$WINDOWS_END\n"],
  "macOS"   => ["\\$MAC_START\n",     "\\$MAC_END\n"],
  "LINUX"   => ["\\$LINUX_START\n",   "\\$LINUX_END\n"],
}

def load_de_setup_partial(name, locale)
  name = File.join(locale, name) unless locale.empty?
  file = File.join("_partials", "#{name}.md")
  content = URI.open("https://raw.githubusercontent.com/lewagon/data-engineering-setup/main/#{file}").read
  content.scan(/\!\[.*\]\((.*)\)/).flatten
         .reject { |ip| ip.start_with?("http") }
         .each   { |ip| content.gsub!(ip, "https://github.com/lewagon/data-engineering-setup/blob/main/#{ip}") }
  content.scan(/src="(images\/.*)"/).flatten
         .each { |ip| content.gsub!(ip, "https://github.com/lewagon/data-engineering-setup/blob/main/#{ip}") }
  content
end

def load_setup_partial(name, locale)
  name = File.join(locale, name) unless locale.empty?
  file = File.join("_partials", "#{name}.md")
  content = URI.open("https://raw.githubusercontent.com/lewagon/setup/master/#{file}").read
  content.scan(/\!\[.*\]\((.*)\)/).flatten
         .each { |ip| content.gsub!(ip, "https://github.com/lewagon/setup/blob/master/#{ip}") }
  content
end

def load_local_partial(name, locale)
  name = File.join(locale, name) unless locale.empty?
  File.read(File.join("_partials", "#{name}.md"), encoding: "utf-8")
end

def load_partial(partial, locale)
  if (m = partial.match(%r{\Ade_setup/(?<name>[0-9a-z_]+)\z}))
    load_de_setup_partial(m[:name], locale)
  elsif (m = partial.match(%r{\Asetup/(?<name>[0-9a-z_]+)\z}))
    load_setup_partial(m[:name], locale)
  else
    load_local_partial(partial, locale)
  end
end

def partial_name(entry) = entry.is_a?(Array) ? entry[0] : entry
def partial_vars(entry) = entry.is_a?(Array) ? entry[1] : {}
def skipped?(entry) = partial_name(entry).start_with?("#")

def collect_partials
  BUILDS.flat_map { |filename, build|
    LOCALES.flat_map { |locale|
      next [] if !locale.empty? && ENGLISH_ONLY.include?(filename)
      build[:partials].reject { |e| skipped?(e) }.map { |e| [partial_name(e), locale] }
    }
  }.uniq.map { |partial, locale|
    ["#{partial}.#{locale}", load_partial(partial, locale)]
  }.to_h
end

def render_content(content, os_name, variables)
  (DELIMITERS.keys - [os_name]).each do |block|
    start_d, end_d = DELIMITERS[block]
    content.gsub!(/#{start_d}(.|\n)*?(?<!#{end_d})#{end_d}/, "")
  end
  DELIMITERS[os_name].each { |d| content.gsub!(/#{d}/, "") }
  content = Liquid::Template.parse(content).render(variables)
  CONSTANTS.each { |k, v| content.gsub!("<#{k}>", v) }
  content
end

def generate_files(loaded)
  LOCALES.each do |locale|
    BUILDS.each do |filename, build|
      next if !locale.empty? && ENGLISH_ONLY.include?(filename)

      output = locale.empty? ? "#{filename}.md" : "#{filename}.#{locale}.md"

      File.open(output, "w:utf-8") do |f|
        build[:partials].reject { |e| skipped?(e) }.each do |entry|
          content = loaded["#{partial_name(entry)}.#{locale}"].clone
          variables = CONSTANTS.merge(partial_vars(entry))
          f << render_content(content, build[:os], variables)
          f << "\n\n"
        end
      end
    end
  end
end

loaded = collect_partials
generate_files(loaded)
