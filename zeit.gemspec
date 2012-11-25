# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zeit/version'

Gem::Specification.new do |gem|
  gem.name          = 'zeit'
  gem.version       = Zeit::VERSION
  gem.authors       = ['Roland Moriz']
  gem.email         = ['roland@moriz.de']
  gem.description   = %q{API client for Zeit.de API}
  gem.summary       = %q{API client for Zeit.de API, not working yet}
  gem.homepage      = "http://github.com/rmoriz/zeit"

  gem.files         = `git ls-files`.split($/).select { |file| file !~ /^spec\/vcr/ }
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/}).select { |file| file !~ /^spec\/vcr/ }
  gem.require_paths = ['lib']

  if RUBY_PLATFORM == 'java'
    gem.add_runtime_dependency 'jruby-openssl'
  end

  gem.add_dependency 'faraday'

  gem.add_development_dependency 'bundler',     '~> 1.0'
  gem.add_development_dependency 'json',        '~> 1.7.5'
  gem.add_development_dependency 'rspec',       '~> 2.12.0'
  gem.add_development_dependency 'guard-rspec', '~> 2.1.2'
  gem.add_development_dependency 'rb-fsevent'
  gem.add_development_dependency 'vcr',         '~> 2.3.0'
  gem.add_development_dependency 'fakeweb',     '~> 1.3.0'
end
