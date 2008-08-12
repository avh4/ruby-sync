module RubySync
  module Source

    # The ancestor class for all RubySync Source implementations. It provides
    # minimal infrastructure for subclasses to build upon and override.
    class Base
      
      # The options available for this Source instance to reference. Should be
      # treated like a hash.
      attr_reader :configuration

      # Creates a new Source instance with the given configuration options.
      def initialize(configuration={})
        @configuration = configuration
      end

      # Returns list of files for current configuration
      def file_list
      end
      
      # Returns true if file exists at path relative to config
      def file_exists
      end
      
      # Returns true if the file is the same file in current source
      def file_match(file)
      end
    end

  end
end
