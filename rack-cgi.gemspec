# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rack-cgi/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Guillermo Álvarez"]
  gem.email         = ["guillermo@cientifico.net"]
  gem.description   = %q{Rack app to call cgi scripts}
  gem.summary       = %q{Rack app to call cgi scripts}
  gem.homepage      = "http://github.com/guillermo/rack-cgi"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rack-cgi"
  gem.require_paths = ["lib"]
  gem.version       = "0.0.1"

  gem.add_dependency "rack"
  gem.add_development_dependency "minitest"
  gem.add_development_dependency "rr"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rack-test"

end
