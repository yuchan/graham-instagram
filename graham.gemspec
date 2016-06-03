# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'graham/version'

Gem::Specification.new do |spec|
  spec.name          = "graham-instagram"
  spec.version       = Graham::VERSION
  spec.authors       = ["Yusuke Ohashi"]
  spec.email         = ["github@junkpiano.me"]
  spec.license       = ['MIT']
  spec.summary       = %q{Instagram Client for Ruby.}
  spec.description   = %q{Instagram Client for Ruby.}
  spec.homepage      = "https://github.com/yuchan/graham-instagram"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "dotenv"
  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
end
