require 'spec_helper'

describe Robot do

  let(:robot) { Robot.new }
  let(:place_command) { PlaceCommand.new Point.new(0, 0), Direction.new(:north) }
  let(:move_command) { MoveCommand.new }
  let(:right_command) { RightCommand.new }
  let(:left_command) { LeftCommand.new }
  let(:report_command) { ReportCommand.new }

  it "should report correctly" do
    robot.point = Point.new(2, 2)
    robot.direction = Direction.new(:north)
    expect(robot.report_message).to eq '2,2,NORTH'
  end

  describe "command execution" do

    it "normal" do
      commands = [
        place_command,
        move_command,
        right_command,
        left_command,
        right_command,
        report_command
      ]
      robot.execute_commands commands
      expect(robot.report_message).to eq '0,1,EAST'
    end

    it "should ignore commands before place_command" do
      commands = [
        move_command,
        right_command,
        left_command,
        report_command,
        place_command
      ]
      robot.execute_commands commands
      expect(robot.report_message).to eq '0,0,NORTH'
    end

    it "should allow multiple placements" do
      commands = [
        place_command,
        move_command,
        place_command
      ]
      robot.execute_commands commands
      expect(robot.report_message).to eq '0,0,NORTH'
    end

    context "fall safe" do

      it "should not place the robot outside the table" do
        outrageous_place_command = PlaceCommand.new(
          Point.new(6, 6), Direction.new(:north)
        )
        robot.execute_commands [outrageous_place_command]
        expect(robot.report_message).to eq 'nil,nil,nil'
      end

      it "should not move the robot outside the table" do
        commands = [
          place_command,
          left_command,
          move_command,
          right_command,
          move_command
        ]
        robot.execute_commands commands
        expect(robot.report_message).to eq '0,1,NORTH'
      end
    end
  end

end