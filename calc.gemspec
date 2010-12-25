# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "calc/version"

Gem::Specification.new do |s|
  s.name        = "calc"
  s.version     = Calc::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Piotr 'Qertoip' Włodarek"]
  s.email       = ["qertoip@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Calculator (mathematical expressions evaluator) library for Ruby}
  s.description = %q{Calc is safe, simple, pure-ruby mathematical expressions evaluator (calculator) library. Although based on Ruby 'eval', it takes special care to sanitize the expression.}

  s.rubyforge_project = "calc"
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
