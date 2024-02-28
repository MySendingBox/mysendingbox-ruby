# coding: utf-8
$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require "mysendingbox/version"

Gem::Specification.new do |spec|
  spec.name          = "mysendingbox"
  spec.version       = Mysendingbox::VERSION
  spec.authors       = ["Mysendingbox"]
  spec.email         = ["hello@mysendingbox.fr"]
  spec.description   = %q{Mysendingbox API Ruby wrapper}
  spec.summary       = %q{Ruby wrapper for Mysendingbox.fr API - ActiveRecord-style syntax}
  spec.homepage      = "https://github.com/mysendingbox/mysendingbox-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", ">= 1.8", "< 3.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.4.2"
end
