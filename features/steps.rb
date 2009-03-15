require 'net/ftp'
require 'spec'

Given /^the remote FTP folder is empty$/ do
  File.exist?('apache-ftpserver-1.0.0/res/features/').should be_true
  FileUtils.rm_rf('apache-ftpserver-1.0.0/res/features/')
  FileUtils.mkdir('apache-ftpserver-1.0.0/res/features/')
  
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

When /^I sync the current folder to the ftp server$/ do
  result = system '../../bin/ruby-sync ./ ftp://localhost:2121'
  result.should == true
end

Then /^the ftp folder contents should match the current folder$/ do
  output = `diff -r ./ ../../apache-ftpserver-1.0.0/res/features/`
  output.should == ""
end