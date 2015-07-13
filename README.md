[![Build Status](https://travis-ci.org/rosette-proj/rosette-extractor-xml.svg)](https://travis-ci.org/rosette-proj/rosette-extractor-xml) [![Code Climate](https://codeclimate.com/github/rosette-proj/rosette-extractor-xml/badges/gpa.svg)](https://codeclimate.com/github/rosette-proj/rosette-extractor-xml) [![Test Coverage](https://codeclimate.com/github/rosette-proj/rosette-extractor-xml/badges/coverage.svg)](https://codeclimate.com/github/rosette-proj/rosette-extractor-xml/coverage)

rosette-extractor-xml
====================

Extracts translatable strings from XML files for the Rosette internationalization platform.

## Installation

`gem install rosette-extractor-xml`

Then, somewhere in your project:

```ruby
require 'rosette/extractors/xml-extractor'
```

### Introduction

This library is generally meant to be used with the Rosette internationalization platform that extracts translatable phrases from git repositories. rosette-extractor-xml is capable of identifying translatable phrases in XML files, specifically those that use one of the following translation strategies:

1. Strings, string arrays, and plurals for Android projects (see: [http://developer.android.com/guide/topics/resources/string-resource.html](http://developer.android.com/guide/topics/resources/string-resource.html)).

Additional types of data organization are straightforward to support. Open an issue or pull request if you'd like to see support for another strategy.

### Usage with rosette-server

Let's assume you're configuring an instance of [`Rosette::Server`](https://github.com/rosette-proj/rosette-server). Adding Android strings support would cause your configuration to look something like this:

```ruby
require 'rosette/extractors/xml-extractor'

rosette_config = Rosette.build_config do |config|
  config.add_repo('my_awesome_repo') do |repo_config|
    repo_config.add_extractor('xml/android') do |extractor_config|
      extractor_config.match_file_extensions(['.xml'])
    end
  end
end

server = Rosette::Server::ApiV1.new(rosette_config)
run server
```

See the documentation contained in [rosette-core](https://github.com/rosette-proj/rosette-core) for a complete list of extractor configuration options in addition to `match_file_extensions`.

### Standalone Usage

While most of the time rosette-extractor-xml will probably be used alongside rosette-server (or similar), there may arise use cases where someone might want to use it on its own. The `extract_each_from` method on `AndroidExtractor` yields `Rosette::Core::Phrase` objects (or returns an enumerator):

```ruby
xml_source_code = '<resources><string name="my_string">Foobarbaz</string></resources>'
extractor = Rosette::Extractors::XmlExtractor::AndroidExtractor.new
extractor.extract_each_from(xml_source_code) do |phrase|
  phrase.meta_key # => "my_string"
  phrase.key      # => "Foobarbaz"
end
```

## Requirements

This project must be run under jRuby. It uses [expert](https://github.com/camertron/expert) to manage java dependencies via Maven. Run `bundle exec expert install` in the project root to download and install java dependencies.

## Running Tests

`bundle exec rake` or `bundle exec rspec` should do the trick.

## Authors

* Cameron C. Dutro: http://github.com/camertron
