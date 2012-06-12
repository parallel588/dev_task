# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dev_task/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Maxim"]
  gem.email         = ["parallel588@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "dev_task"
  gem.require_paths = ["lib"]
  gem.version       = DevTask::VERSION

  gem.add_dependency(%q<rails>, [">= 3.2"])
  gem.add_dependency(%q<rake>, [">= 0"])
  gem.add_dependency(%q<sass>, ["= 3.1.10"])

end
