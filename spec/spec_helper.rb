# encoding: UTF-8

require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'expert'
Expert.environment.require_all

require 'rspec'
require 'rosette/extractors/xml-extractor'
require 'yaml'
require 'pry-nav'

FIXTURE_PARENT = File.expand_path('./', File.dirname(__FILE__))
FIXTURE_DIR = File.join(FIXTURE_PARENT, 'fixtures')
FIXTURE_MANIFEST = YAML.load_file(File.join(FIXTURE_PARENT, 'fixtures.yml'))
