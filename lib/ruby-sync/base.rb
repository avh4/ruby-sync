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
      @from.dir_list.each do |dir|
        ftp.mkdir("#{dir}")
      end
      @from.file_list.each do |file|
        ftp.putbinaryfile("./#{file}", file)
      end
      ftp.close
    end
  end
end