# encoding: UTF-8

require 'jbundler'
require 'rspec'
require 'rosette/extractors/xml-extractor'
require 'yaml'
require 'pry-nav'

FIXTURE_PARENT = File.expand_path('./', File.dirname(__FILE__))
FIXTURE_DIR = File.join(FIXTURE_PARENT, 'fixtures')
FIXTURE_MANIFEST = YAML.load_file(File.join(FIXTURE_PARENT, 'fixtures.yml'))
