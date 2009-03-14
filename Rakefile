%w[rubygems rake rake/clean fileutils newgem rubigen].each { |f| require f }
require File.dirname(__FILE__) + '/lib/ruby-sync'
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

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.new('ruby-sync', version) do |p|
  p.developer('Adam Salter', 'adam@codebright.net')
  p.changes              = p.paragraphs_of("History.txt", 0..1).join("\n\n")
  p.post_install_message = 'PostInstall.txt' # TODO remove if post-install message not required
  p.rubyforge_name       = p.name # TODO this is default value
  p.extra_deps         = [
    ['net-ssh','>= 2.0.0'],
  ]
  p.extra_dev_deps = [
    ['newgem', ">= #{::Newgem::VERSION}"]
  ]
  
  p.clean_globs |= %w[**/.DS_Store tmp *.log]
  path = (p.rubyforge_name == p.name) ? p.rubyforge_name : "\#{p.rubyforge_name}/\#{p.name}"
  p.remote_rdoc_dir = File.join(path.gsub(/^#{p.rubyforge_name}\/?/,''), 'rdoc')
  p.rsync_args = '-av --delete --ignore-errors'
end

require 'newgem/tasks' # load /tasks/*.rake
Dir['tasks/**/*.rake'].each { |t| load t }

# TODO - want other tests/tasks run by default? Add them to the list
# task :default => [:spec, :features]
