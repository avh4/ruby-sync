require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'net/ftp'

describe RubySync::Base do
  before(:each) do
    @dir = mock("Filesystem")
    @b = RubySync::Base.new(@dir)
  end
  it "should send a file over FTP" do
    @dir.stub!(:file_list).and_return(['file.txt'])
    @ftp = mock("FTP")
    Net::FTP.should_receive(:new).and_return(@ftp)
    @ftp.should_receive(:connect).with("localhost", 2121)
    @ftp.should_receive(:login)
    @ftp.should_receive(:putbinaryfile).with("./file.txt")
    @ftp.should_receive(:close)
    
    @b.synchronize
  end
  it "should send many files over FTP" do
    @dir.stub!(:file_list).and_return(['file1.txt', 'file2.txt', 'file3.txt'])
    @ftp = mock("FTP")
    Net::FTP.should_receive(:new).and_return(@ftp)
    @ftp.should_receive(:connect).with("localhost", 2121)
    @ftp.should_receive(:login)
    @ftp.should_receive(:putbinaryfile).with("./file1.txt")
    @ftp.should_receive(:putbinaryfile).with("./file2.txt")
    @ftp.should_receive(:putbinaryfile).with("./file3.txt")
    @ftp.should_receive(:close)
    
    @b.synchronize
  end
end