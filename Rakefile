require 'lib/ruby-sync/version'

require 'echoe'

version = RubySync::Version::STRING.dup
if ENV['SNAPSHOT'].to_i == 1
  version << "." << Time.now.utc.strftime("%Y%m%d%H%M%S")
end

Echoe.new('ruby-sync', version) do |p|
  p.changelog        = "CHANGELOG.rdoc"

  p.author           = "Adam Salter"
  p.email            = "adam@codebright.net"

  p.summary = <<-DESC.strip.gsub(/\n\s+/, " ")
    A full file synchronisation library for ruby, supports
    syncing/mirroring with local and FTP/SSH directories.
  DESC

  p.url              = "http://ruby-sync.rubyforge.org"
  p.need_zip         = true
  p.rdoc_pattern     = /^(lib|README.rdoc|CHANGELOG.rdoc)/
  p.clean_pattern    = /pkg/

  p.dependencies     = ["net-ssh         >=2.0.0"]
end
