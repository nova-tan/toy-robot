class Robot < Struct.new(:point, :direction)

  def initialize(point = NullPoint.new, direction = NullDirection.new)
    self.point = point
    self.direction = direction
  end

  def execute_commands(commands)
    commands.each do |cmd|
      cmd.execute(self) if ExecutionPlanner.new(self, cmd).safe?
    end
  end

  def report
    puts "Output: #{report_message}"
    report_message
  end

  def move
    self.point = point + direction.offset
  end

  def turn_right
    self.direction = direction.turn_right
  end

  def turn_left
    self.direction = direction.turn_left
  end

  def report_message
    "#{point},#{direction}"
  end

end