require 'yaml'

specs_path = File.join('test.yml')

package_confs = YAML.load_file(specs_path)

puts "package_confs #{package_confs["setup"]}"

puts "\nflatten #{package_confs["setup"].flatten}"
