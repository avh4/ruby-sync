module RubySync
  module Sources
    class Local < Sources::Base
      def initialize()
        
      end
      def file_list
        Dir.entries('.').select { |f| f != "." and f != '..' }
      end
    end
  end
end