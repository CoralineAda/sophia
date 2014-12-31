module Gramercy
  module Constructors
    class Generator

      def prepare
        parser.prepare
      end

      def parser
        @parser ||= Gramercy::Parser.new(File.read('./data/corpus.txt'))
      end

      def sentence_structure
        parser.dictionary.generate_1_sentence
      end

      def sentence
        sentence_structure.split.map do |part_of_speech|
          if candidates = Grammar::PartsOfSpeech::WORD_LIST.fetch(part_of_speech.to_sym, false)
            candidates.sample
          elsif part_of_speech == 'noun'
            parser.nouns.sample
          elsif part_of_speech == 'adjective'
            parser.adjectives.sample
          end
        end.compact.join(' ')
      end

    end
  end
end