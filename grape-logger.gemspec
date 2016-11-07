# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grape_logger/version'

Gem::Specification.new do |spec|
  spec.name          = 'grape-logger'
  spec.version       = GrapeLogger::VERSION
  spec.authors       = %w(aserafin superiorlu)
  spec.email         = ['adrian@softmad.pl, luyingrui518@gmail.com']

  spec.summary       = 'Out of the box request logging for Grape!'
  spec.description   = 'This gem provides simple request logging for Grape with just few lines of code you have to put in your project! In return you will get response codes, paths, parameters and more!'
  spec.homepage      = 'http://github.com/superiorlu/grape-logger'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'grape', '~> 0.16'

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.40'
end
