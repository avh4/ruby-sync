require 'echoe'

version = RubySync::Version::STRING.dup
if ENV['SNAPSHOT'].to_i == 1
  version << "." << Time.now.utc.strftime("%Y%m%d%H%M%S")
end

Echoe.new('ruby-sync', version) do |p|
  p.changelog        = "CHANGELOG.rdoc"

  p.author           = "Jamis Buck"
  p.email            = "jamis@jamisbuck.org"

  p.summary = <<-DESC.strip.gsub(/\n\s+/, " ")
    A full file synchronisation library for ruby, supports
    syncing/mirroring with local and FTP/SSH directories.
  DESC

  p.url              = "http://ruby-sync.rubyforge.org"
  p.need_zip         = true
  p.rdoc_pattern     = /^(lib|README.rdoc|CHANGELOG.rdoc)/

  p.dependencies     = ["net-ssh         >=2.0.0",
                        "net-sftp        >=2.0.0",
                        "net-scp         >=1.0.0",
                        "net-ssh-gateway >=1.0.0",
                        "highline"]
end
