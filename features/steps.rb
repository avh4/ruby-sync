require 'net/ftp'
require 'spec'

Given /^the remote FTP folder is empty$/ do
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