# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ruby-sync}
  s.version = "2.4.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Adam Salter"]
  s.date = %q{2009-03-14}
  s.description = %q{A full file synchronisation library for ruby, supports syncing/mirroring with local and FTP/SSH directories.}
  s.email = %q{adam@codebright.net}
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "lib/ruby-sync/version.rb", "lib/ruby-sync.rb", "README.rdoc"]
  s.files = ["CHANGELOG.rdoc", "lib/ruby-sync/version.rb", "lib/ruby-sync.rb", "Manifest", "Rakefile", "README.rdoc", "ruby-sync.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://ruby-sync.rubyforge.org}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Ruby-sync", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{ruby-sync}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A full file synchronisation library for ruby, supports syncing/mirroring with local and FTP/SSH directories.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<net-ssh>, [">= 2.0.0"])
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<net-ssh>, [">= 2.0.0"])
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<net-ssh>, [">= 2.0.0"])
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end
