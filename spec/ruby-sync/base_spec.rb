require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'net/ftp'

describe RubySync::Base do
  before(:each) do
    @dir = mock("Filesystem")
    @b = RubySync::Base.new(@dir)
    @dir.stub!(:dir_list).and_return([])
  end
  it "should send a file over FTP" do
    @dir.stub!(:file_list).and_return(['file.txt'])
    @ftp = mock("FTP")
    Net::FTP.should_receive(:new).and_return(@ftp)
    @ftp.should_receive(:connect).with("localhost", 2121)
    @ftp.should_receive(:login)
    @ftp.should_receive(:putbinaryfile).with("./file.txt", "file.txt")
    @ftp.should_receive(:close)
    
    @b.synchronize
  end
  it "should send many files over FTP" do
    @dir.stub!(:file_list).and_return(['file1.txt', 'file2.txt', 'file3.txt'])
    @ftp = mock("FTP")
    Net::FTP.should_receive(:new).and_return(@ftp)
    @ftp.should_receive(:connect).with("localhost", 2121)
    @ftp.should_receive(:login)
    @ftp.should_receive(:putbinaryfile).with("./file1.txt", "file1.txt")
    @ftp.should_receive(:putbinaryfile).with("./file2.txt", "file2.txt")
    @ftp.should_receive(:putbinaryfile).with("./file3.txt", "file3.txt")
    @ftp.should_receive(:close)
    
    @b.synchronize
  end
  
  it "should send files and folders over FTP" do
    @dir.stub!(:file_list).and_return(['index.html', 'css/style.css', 'images/top.png'])
    @dir.stub!(:dir_list).and_return(['css', 'images'])
    @ftp = mock("FTP")
    Net::FTP.should_receive(:new).and_return(@ftp)
    @ftp.should_receive(:connect).with("localhost", 2121)
    @ftp.should_receive(:login)
    @ftp.should_receive(:mkdir).with('css')
    @ftp.should_receive(:mkdir).with('images')
    @ftp.should_receive(:putbinaryfile).with("./index.html", "index.html")
    @ftp.should_receive(:putbinaryfile).with("./css/style.css", "css/style.css")
    @ftp.should_receive(:putbinaryfile).with("./images/top.png", "images/top.png")
    @ftp.should_receive(:close)
    
    @b.synchronize
  end
end