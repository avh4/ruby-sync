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
          files += Dir.entries(d).map { |f| d=='.' ? f : "#{d}/#{f}"}.select { |f| not File.directory?(f) }
        end
        files
      end
      def dir_list
        in_dirs = ['.']
        out_dirs = []
        while (not in_dirs.empty?) do
          dir = in_dirs.pop
          new_dirs = Dir.entries(dir).select { |f| f != '.' && f != '..' }.map{ |f| dir=='.' ? f : "#{dir}/#{f}" }.select { |f| File.directory?(f) }
          out_dirs += new_dirs
          in_dirs += new_dirs
        end
        out_dirs
      end
    end
  end
end