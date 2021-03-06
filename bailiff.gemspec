# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bailiff/version'

Gem::Specification.new do |spec|
  spec.name          = 'bailiff'
  spec.version       = Bailiff::VERSION
  spec.authors       = ['Steven De Coeyer', 'Jeroen Jacobs', 'Jeroen De Vos']
  spec.email         = ['devops@openminds.be']
  spec.summary       = 'bailiff'
  spec.description   = 'bailiff'
  spec.homepage      = 'http://www.openminds.be'
  spec.license       = 'MIT'

  spec.files         = Dir['README.md', 'LICENSE', 'lib/*', 'lib/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'net-ssh', '~> 2.7'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake', '~> 10.1'
  spec.add_development_dependency 'minitest', '~> 4.7'
  spec.add_development_dependency 'pry'
end
