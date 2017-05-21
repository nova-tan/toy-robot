class ExecutionPlanner

  attr_accessor :testbot, :command

  def initialize(robot, command)
    self.testbot = Testbot.from_robot(robot)
    self.command = command
  end

  def safe?
    command.execute(testbot)
    testbot.safe?
  end
end