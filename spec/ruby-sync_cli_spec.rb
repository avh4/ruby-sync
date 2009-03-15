require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'ruby-sync/cli'

describe Ruby-sync::CLI, "execute" do
  before(:each) do
    @stdout_io = StringIO.new
    Ruby-sync::CLI.execute(@stdout_io, [])
    @stdout_io.rewind
    @stdout = @stdout_io.read
  end
  
  it "should do something" do
    @stdout.should_not =~ /To update this executable/
  end
end