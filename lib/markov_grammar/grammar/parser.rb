module MarkovGrammar
  module Grammar
    class Parser

      attr_accessor :text

      def initialize(text="")
        @text = text
      end

      def adjectives
        @adjectives ||= noun_phrases.map do |phrase|
          split = phrase.split
          next if phrase.length == 1
          split[-2..0]
        end.compact.flatten.uniq
      end

      def bare_words
        @bare_words ||= words.map do |word|
          word.downcase.gsub(/[^a-zA-Z]+$/, '').gsub(/^[^a-zA-Z]+/, '')
        end
      end

      def interrogative
        if match = Interrogative.any_in(base_form: bare_words).first
          match.base_form
        end
      end

      def is_interrogative?
        interrogative.present?
      end

      def nouns
        Grammar::PartsOfSpeech.probable_nouns_from(self.text) - verbs
      end

      def object
        nouns.last
      end

      def sentences
        @sentence ||= begin
          text = corpus.gsub(/(#{Grammar::PartsOfSpeech::HONORIFICS * '|'})/i, '\1@@@')
          text = text.split(/[\.\?\!\;\,] /)
          text = text.map{|t| t.gsub('@@@', '')}
          text = words_from(text.join(' '))
        end
      end

      def subject
        nouns.first
      end

      def verbs
        stems = MarkovGrammar::Verb.stems
        words.select{|w| stems.include?(Lingua.stemmer(w))}
      end

      def words
        @words ||= text.split.map do |word|
          word = word.gsub(/[^a-z]$/i, '')
          word = word.gsub(/^[^a-z]+/i, '')
          word = word.gsub(/'./, '')
          word = word.gsub(/'ll/, '')
          word = word.split('--')
        end.flatten
      end

    end
  end
end