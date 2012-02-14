# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "enumeradical/version"

Gem::Specification.new do |s|
  s.name        = "enumeradical"
  s.version     = Enumeradical::VERSION
  s.authors     = ["coreyhaines"]
  s.email       = ["coreyhaines@gmail.com"]
  s.summary     = %q{Enumeradical takes bland enumerable functions and uses them to create AMAZINGALITY!}
  s.description = %q{Enumeradical is a collection of useful functions for iterating over collections in common ways.}

  s.rubyforge_project = "enumeradical"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "travis-lint"
  s.add_development_dependency "rspec"
end
