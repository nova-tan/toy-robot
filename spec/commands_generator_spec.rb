require 'spec_helper'

describe CommandsGenerator do

  let(:file_path) { File.join(Dir.pwd, 'test_data', 'test1') }
  let(:generator) { CommandsGenerator.new file_path }

  it "should read the commands" do
    expect(generator.commands.size).to eq 3
  end
end