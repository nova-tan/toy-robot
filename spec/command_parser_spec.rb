require 'spec_helper'

describe CommandParser do

  let(:parser) { CommandParser.new }

  it "should parse correct commands" do
    expect(parser.parse('PLACE 0,0,NORTH').class).to eq PlaceCommand
    expect(parser.parse('LEFT').class).to eq LeftCommand
    expect(parser.parse('RIGHT').class).to eq RightCommand
    expect(parser.parse('MOVE').class).to eq MoveCommand
    expect(parser.parse('Report').class).to eq ReportCommand
  end

  it "init place command with correct point and direction" do
    cmd = parser.parse('PLACE 0,0,NORTH')
    expect(cmd.point).to eq Point.new(0, 0)
    expect(cmd.direction).to eq Direction.new(:north)
  end
end