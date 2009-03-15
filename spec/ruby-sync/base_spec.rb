require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'net/ftp'

describe RubySync::Base do
  before(:each) do
    @b = RubySync::Base.new
  end
  it "should send a file over FTP" do
    @ftp = mock("FTP")
    Net::FTP.should_receive(:new).and_return(@ftp)
    @ftp.should_receive(:connect).with("localhost", 2121)
    @ftp.should_receive(:login)
    @ftp.should_receive(:putbinaryfile).with("./file.txt")
    @ftp.should_receive(:close)
    
    @b.synchronize
    
  end
end