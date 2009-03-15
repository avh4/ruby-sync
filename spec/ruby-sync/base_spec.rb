require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'net/ftp'

describe RubySync::Base do
  before(:each) do
    @dir = mock("Filesystem")
    @b = RubySync::Base.new(@dir)
  end
  it "should send a file over FTP" do
    @dir.stub!(:files).and_return(['file.txt'])
    @ftp = mock("FTP")
    Net::FTP.should_receive(:new).and_return(@ftp)
    @ftp.should_receive(:connect).with("localhost", 2121)
    @ftp.should_receive(:login)
    @ftp.should_receive(:putbinaryfile).with("./file.txt")
    @ftp.should_receive(:close)
    
    @b.synchronize
  end
end