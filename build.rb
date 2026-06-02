#!/usr/bin/env ruby
# frozen_string_literal: true

require 'yaml'
require_relative 'lib/builder'

repos_cfg = YAML.load_file('constants/repos.yml').freeze
constants = YAML.load_file('constants/constants.yml').freeze

builds = Dir['builds/*.yml'].map { |filename|
  name = File.basename(filename, '.yml')
  data = YAML.load_file(filename)
  [name, { os: data['os'], locales: data['locales'], partials: data['partials'] }]
}.to_h.freeze

Builder.new(builds, constants, repos_cfg).run
