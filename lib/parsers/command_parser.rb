class CommandParser

  attr_accessor :cmd_str

  def parse(cmd_str)
    self.cmd_str = cmd_str.strip
    return place_command if is_place_command?
    other_command
  end

private

  def is_place_command?
    cmd_str.start_with? 'PLACE'
  end

  def place_command
    PlaceCommand.new(point, direction)
  end

  def other_command
    Object.const_get("#{cmd_str.capitalize}Command").new
  end

  def point
    Point.new x_coord, y_coord
  end

  def x_coord
    place_command_params[0].to_i
  end

  def y_coord
    place_command_params[1].to_i
  end

  def direction
    Direction.new(direction_str.downcase.to_sym)
  end

  def direction_str
    place_command_params.last
  end

  def place_command_params
    cmd_str[6..-1].split(',')
  end
end