Dir["#{Dir.pwd}/lib/**/*.rb"].each {|f| require f}

Dir["#{Dir.pwd}/test_data/*"].each do |test_file_path|
  File.open(test_file_path, 'r') do |file|
    while (line = file.gets)
      puts line
    end
  end
  Robot.new.execute_commands CommandsGenerator.new(test_file_path).commands
  puts
end