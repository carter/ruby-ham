# encoding: utf-8

Gem::Specification.new do |gem|
  gem.name          = 'ruby-ham'
  gem.summary       = 'Ruby based library for accessing amateur radio APIs'
  gem.description   = gem.summary
  gem.authors       = ['Carter Parks']
  gem.email         = ['carter@carterparks.com']
  gem.homepage      = 'https://github.com/carter/ruby-ham'
  gem.require_paths = ['lib/']
  gem.version       = '0.0.0'
  gem.files         = `git ls-files`.split("\n").reject { |name| name.include?('examples') }
  gem.test_files    = `git ls-files -- {spec}/*`.split("\n")
  gem.license       = 'MIT'

  gem.add_dependency "nokogiri"
end
