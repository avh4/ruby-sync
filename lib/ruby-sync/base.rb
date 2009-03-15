require 'net/ftp'

module RubySync
  class Base
    def initialize(filesystem)
      @filesystem = filesystem
    end
    def synchronize
      ftp = Net::FTP.new
      ftp.connect("localhost", 2121)
      ftp.login
      ftp.putbinaryfile("./file.txt")
      ftp.close
    end
  end
end