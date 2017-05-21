require 'spec_helper'

describe Point do

  let(:point1) { Point.new(2, 3) }
  let(:point2) { Point.new(1, -1) }

  it "produce correct point when add up" do
    point3 = point1 + point2
    expect(point3.x).to eq 3
    expect(point3.y).to eq 2
  end
end