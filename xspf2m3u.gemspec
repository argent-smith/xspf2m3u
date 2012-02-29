# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "xspf2m3u/version"

Gem::Specification.new do |s|
  s.name        = "xspf2m3u"
  s.version     = Xspf2m3u::VERSION
  s.authors     = ["Pavel Argentov"]
  s.email       = ["argentoff@gmail.com"]
  s.homepage    = "https://github.com/argent-smith/xspf2m3u"
  s.summary     = %q{Tiny simple little dumb xspf -> extended m3u converter}
  s.description = %q{Usage: xspf2m3u -i one.xspf -o two.m3u}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.extra_rdoc_files = %w{README.rdoc LICENSE.rdoc HISTORY.md}
  s.rdoc_options     = %W{--main README.rdoc --line-numbers}

  s.add_development_dependency "rake"
  s.add_development_dependency "bddgen"
  s.add_development_dependency "aruba"
  s.add_development_dependency "ZenTest"
  s.add_development_dependency "autotest-notification"
  s.add_development_dependency "pry"
  s.add_development_dependency "gemcutter"
  s.add_development_dependency "rdoc"

  s.add_runtime_dependency "thor"
  s.add_runtime_dependency "xspf"
end
