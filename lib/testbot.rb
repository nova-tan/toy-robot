class Testbot < Robot

  def self.from_robot(robot)
    Testbot.new robot.point, robot.direction
  end

  def safe?
    table.on_table? point
  end

  def report
    # Do nothing
  end

private

  def table
    Table.new
  end

end