module RubySync

  # Describes the current version.
  class Version
    MAJOR = 0
    MINOR = 0
    TINY  = 1

    # The current version, as a Version instance
    CURRENT = new(MAJOR, MINOR, TINY)

    # The current version, as a String instance
    STRING  = CURRENT.to_s
  end

end
