require 'spec_helper'

describe Table do

  let(:table) { Table.new }

  it "should tell if point is on table" do
    on_table_point = Point.new(5, 0)
    off_table_point = Point.new(6, 0)
    expect(table.on_table? on_table_point).to be_true
    expect(table.on_table? off_table_point).to be_false
  end
end