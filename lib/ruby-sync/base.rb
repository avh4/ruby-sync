require 'net/ftp'

module RubySync
  class Base
    def initialize(filesystem)
      @from = filesystem
    end
    def synchronize
      ftp = Net::FTP.new
      ftp.connect("localhost", 2121)
      ftp.login
      @from.file_list.each do |file|
        ftp.putbinaryfile("./#{file}")
      end
      ftp.close
    end
  end
end