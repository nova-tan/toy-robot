class PlaceCommand

  attr_accessor :point, :direction

  def initialize(point, direction)
    self.point = point
    self.direction = direction
  end

  def execute(robot)
    robot.point = point
    robot.direction = direction
  end

end