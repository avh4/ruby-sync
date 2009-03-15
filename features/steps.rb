require 'net/ftp'
require 'spec'

Given /^the remote FTP folder is empty$/ do
  ftp = Net::FTP.new
  ftp.connect('localhost', 2121)
  ftp.login
  files = ftp.list('.')
  files.should be_empty
  ftp.close
end