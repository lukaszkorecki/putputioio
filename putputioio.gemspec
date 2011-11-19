# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "putputioio/version"

Gem::Specification.new do |s|
  s.name        = "PutPutIoIo"
  s.version     = PutPutIoIo::VERSION
  s.authors     = ["Łukasz Korecki"]
  s.email       = ["lukasz@coffeesounds.com"]
  s.homepage    = "http://github.com/lukaszkorecki/putputioio"
  s.summary     = %q{put.io client}
  s.description = %q{a nifty command line only client for put.io}


  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
