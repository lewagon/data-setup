
require 'yaml'

# read package conf
specs_path = File.join('specs', 'base', 'packages.yml')

package_confs = YAML.load_file(specs_path)

python_version  = package_confs["python"]
glovebox        = package_confs["glovebox"]
setup           = package_confs["setup"]
platform        = package_confs["platform"]
modules         = package_confs["modules"]

full_mods = modules.values.flatten

confs = {
    glovebox:       glovebox,
    apple_intel:    glovebox + setup + full_mods + platform["apple_intel"],
    apple_silicon:  glovebox + setup + full_mods + platform["apple_silicon"],
    windows_10:     glovebox + setup + full_mods + platform["windows_10"],
    windows_11:     glovebox + setup + full_mods + platform["windows_11"],
    linux:          glovebox + setup + full_mods + platform["linux"],
}

# write python version
python_path = File.join('specs', 'validated', 'python_version.txt')

File.open(python_path, 'w') { |file| file.write("#{python_version}\n") }

# write generated conf files
confs.each do |conf, packages|

  # build conf requirement path
  conf_path = File.join('specs', 'constraintless', "#{conf}.txt")
  conf_raw_path = File.join('specs', 'generated', "#{conf}.txt")

  # File.open(conf_path, 'w') do |file|
    File.open(conf_raw_path, 'w') do |file_raw|

      # write packages
      packages.each do |package|

        raw_package = package.gsub(/<.*/, '').gsub(/<=.*/, '')
          .gsub(/>.*/, '').gsub(/>=.*/, '').gsub(/==.*/, '')

        # file.write("#{package}\n")
        file_raw.write("#{raw_package}\n")

      end

    end
  # end

end
