require 'spec_helper'

describe Direction do

  let(:direction) {Direction.new(:north)}

  it "should return correct offset" do
    expect(direction.offset.to_s).to eq '0,1'
  end

  it "should return correct direction" do
    expect(direction.turn_right.direction).to eq :east
    expect(direction.turn_left.direction).to eq :west
  end

  it "should return correct direction when currection direction is the last one" do
    expect(Direction.new(:west).turn_right.direction).to eq :north
  end
end