require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'ruby-sync/cli'

describe RubySync::CLI, "execute" do
  before(:each) do
    @stdout_io = StringIO.new
  end
  
  def do_exec
    RubySync::CLI.execute(@stdout_io, [])
    @stdout_io.rewind
    @stdout = @stdout_io.read
  end
  
  it "should call RubySync" do
    @mock = mock("Base")
    RubySync::Base.should_receive(:new).and_return(@mock)
    @mock.should_receive(:synchronize)
    do_exec
  end
  
end