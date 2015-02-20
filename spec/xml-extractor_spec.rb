# encoding: UTF-8

require 'spec_helper'

include Rosette::Extractors

describe XmlExtractor do
  FIXTURE_MANIFEST.each_pair do |extractor_name, expected_results|
    describe extractor_name do
      let(:extractor) do
        capitalized_name = Rosette::Core::StringUtils.camelize(extractor_name.to_s)
        XmlExtractor.const_get("#{capitalized_name}Extractor").new
      end

      expected_results.each_pair do |expected_file, expected_phrases|
        it "extracts phrases correctly from #{expected_file}" do
          source_file = File.join(FIXTURE_DIR, expected_file)

          extractor.extract_each_from(File.read(source_file)).each do |actual_phrase, line_number|
            expected_phrase_index = expected_phrases.find_index { |phrase| phrase['meta_key'] == actual_phrase.meta_key }
            expected_phrase = expected_phrases[expected_phrase_index]
            expect(expected_phrase).to_not be_nil
            expect(expected_phrase['key']).to eq(actual_phrase.key)
            expected_phrases.delete_at(expected_phrase_index)
          end

          expect(expected_phrases).to be_empty
        end
      end
    end
  end
end
