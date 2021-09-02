require_relative '../config.rb'

python_version = %x[python -V]
if python_version =~ /#{CONSTANTS["PYTHON_VERSION"]}/
  puts "✅ Your Python version OK."
else
  puts "❌ Your Python version is #{python_version.match(/(\d\.\d\.\d)/)[0]} but it should be #{CONSTANTS['PYTHON_VERSION']}."
end
