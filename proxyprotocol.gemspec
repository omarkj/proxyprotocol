# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'proxyprotocol/version'

Gem::Specification.new do |spec|
  spec.name          = "proxyprotocol"
  spec.version       = Proxyprotocol::VERSION
  spec.authors       = ["Ómar Kjartan Yasin"]
  spec.email         = ["omarkj@gmail.com"]
  spec.summary       = "A wrapper around TCPSocket that support the Proxy Protocol"
  spec.homepage      = "https://github.com/heroku/proxyprotocol"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end