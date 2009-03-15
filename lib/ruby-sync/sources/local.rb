module RubySync
  module Sources
    class Local < Sources::Base
      def initialize()
        
      end
      def file_list
        files = []
        dirs = ['.']
        dirs += dir_list
        dirs.each do |d|
          files += Dir.entries(d).select { |f| not File.directory?(f) }.map { |f| d=='.' ? f : "#{d}/#{f}"}
        end
        files
      end
      def dir_list
        dirs = Dir.entries('.').select { |f| File.directory?(f) }
        dirs.delete('.')
        dirs.delete('..')
        dirs
      end
    end
  end
end