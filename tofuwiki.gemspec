# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require 'tofuwiki'
Gem::Specification.new do |s|
  s.name        = "tofuwiki"
  s.version     = Tofuwiki::VERSION
  s.platform    = Gem::Platform::RUBY
  s.licenses    = ['MIT']
  s.authors     = ["Alice Ferrazzi"]
  s.email       = ["alice.ferrazzi@gmail.com"]
  s.homepage    = "http://public.aliceinwire.net/software/tofuwiki.html"
  s.summary     = %q{Wiki with Vim interface and Git repo}
  s.description = %q{A personal and collaborative wiki for Vim users}

  s.rubyforge_project = "tofuwiki"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  additional_info = <<-INFO
For optional compilation of the wiki to html you will need:
 - haml
and for markdown support:
 - rdiscount
  INFO

  s.requirements = additional_info
  s.post_install_message = additional_info

  #s.add_dependency 'haml'
  #s.add_dependency 'rdiscount'
end
