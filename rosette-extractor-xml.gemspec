$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'rosette/extractors/xml-extractor/version'

Gem::Specification.new do |s|
  s.name     = 'rosette-extractor-xml'
  s.version  = ::Rosette::Extractors::XML_EXTRACTOR_VERSION
  s.authors  = ['Cameron Dutro']
  s.email    = ['camertron@gmail.com']
  s.homepage = 'http://github.com/camertron'

  s.description = s.summary = 'Extracts translatable strings from XML files for the Rosette internationalization platform.'

  s.add_dependency('nokogiri', '~> 1.6.0')
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true

  s.require_path = 'lib'
  s.files = Dir["{lib,spec}/**/*", 'Gemfile', 'History.txt', 'README.md', 'Rakefile', 'rosette-extractor-xml.gemspec']
end
