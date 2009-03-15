require 'net/ftp'
require 'spec'

Before do
  @original_wd = Dir.getwd
  @ftp_dir = File.expand_path('apache-ftpserver-1.0.0/res/features/')
end

After do
  Dir.chdir(@original_wd)
end

Given /^the remote FTP folder is empty$/ do
  File.exist?(@ftp_dir).should be_true
  FileUtils.rm_rf(@ftp_dir)
  FileUtils.mkdir(@ftp_dir)
  
  ftp = Net::FTP.new
  ftp.connect('localhost', 2121)
  ftp.login
  files = ftp.list('.')
  ftp.close
  
  files.should be_empty
end

Given /^I am in folder with a single file$/ do
  Dir.chdir('test_data/1')
  files = Dir.entries('.').select { |f| f != "." and f != '..' }
  
  files.size.should == 1
end

Given /^I am in a folder with many files$/ do
  Dir.chdir('test_data/2')
  files = Dir.entries('.').select { |f| f != "." and f != '..' }
  
  files.size.should == 8
end

When /^I sync the current folder to the ftp server$/ do
  result = system '../../bin/ruby-sync ./ ftp://localhost:2121'
  result.should == true
end

Then /^the ftp folder contents should match the current folder$/ do
  output = `diff -r ./ "#{@ftp_dir}"`
  output.should == ""
end