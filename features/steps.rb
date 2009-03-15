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

Given /^I am in a folder with .* \(example ([0-9]*)\)$/ do |example|
  dir = "test_data/#{example}"
  File.exist?(dir).should be_true
  File.directory?(dir).should be_true
  Dir.chdir(dir)
end

When /^I sync the current folder to the ftp server$/ do
  result = system '../../bin/ruby-sync ./ ftp://localhost:2121'
  result.should == true
end

Then /^the ftp folder contents should match the current folder$/ do
  output = `diff -r ./ "#{@ftp_dir}"`
  output.should == ""
end