# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'opsgenie/send/version'

Gem::Specification.new do |spec|
  spec.name          = "opsgenie-send"
  spec.version       = Opsgenie::Send::VERSION
  spec.authors       = ["Richard Lister"]
  spec.email         = ["rlister+gh@gmail.com"]

  spec.summary       = %q{Minimalist ruby library to send alerts and heartbeats to Opsgenie.}
  spec.description   = %q{Minimalist ruby library to send alerts and heartbeats to Opsgenie.}
  spec.homepage      = 'https://github.com/rlister/opsgenie-send'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
end