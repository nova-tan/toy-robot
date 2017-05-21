class CommandsGenerator

  attr_accessor :file_path, :commands

  def initialize(file_path)
    self.file_path = file_path
    self.commands = []
    generate
  end

private

  def generate
    File.open(file_path, 'r') do |file|
      while (line = file.gets)
        commands << command_parser.parse(line)
      end
    end
  end

  def command_parser
    CommandParser.new
  end
end