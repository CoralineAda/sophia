module MarkovGrammar
  module Grammar
    class Parser

      attr_accessor :corpus, :parsed_corpus

      def initialize
        self.corpus = load_corpus.lines.map(&:strip).reject(&:empty?)[0..1].join("\n")
      end

      def load_corpus
        File.read("./data/corpus.txt")  
      end
      
      def prepare
        File.open("data/structures.txt", "w") do |file|
          file.puts sentence_structures.join(". ")
        end
      end

      def dictionary
        return @dictionary if @dictionary
        @dictionary ||= ::MarkyMarkov::Dictionary.new('./data/dictionary')
        @dictionary.parse_file('./data/structures.txt')
        @dictionary.save_dictionary!
        @dictionary
      end

      def words_from(text)
        text.split.map do |word|
          word = word.gsub(/[^a-z]$/i, '')
          word = word.gsub(/^[^a-z]+/i, '')
          word = word.gsub(/'./, '')
          word = word.gsub(/'ll/, '')
          word = word.split('--')
        end.flatten
      end

      def replace_nouns
        Grammar::PartsOfSpeech.probable_nouns_from(self.corpus).each do |noun|
          words_from.join(' ').gsub(noun, 'noun').split
        end
      end

      def parts_of_speech
        @parts_of_speech ||= Grammar::PartsOfSpeech::WORD_LIST.keys.map(&:to_s)
      end

      def noun_phrases
        bare_words.join(' ').split('|').reject{|w| w == '|'}.reject{|w| w == ' '}.reject(&:empty?).map(&:strip)
      end

      def adjectives
        @adjectives ||= noun_phrases.map do |phrase|
          split = phrase.split
          next if phrase.length == 1
          split[-2..0]
        end.compact.flatten.uniq
      end

      def nouns
        @nouns ||= noun_phrases.map do |phrase|
          split = phrase.split
          split[-1]
        end.flatten.uniq - adjectives
      end

      def subject
        nouns.first
      end

      def object
        nouns.last
      end

      def bare_words
        @bare_words ||= with_initial_substitutions.map do |sentence|
          words_from(sentence).map do |word|
            word = word.gsub(/[^a-z]+$/i, '')
            word = word.gsub(/^[^a-z]+/i, '')
            word = word.downcase
            parts_of_speech.include?(word) ? '|' : word
          end.join(' ')
        end
      end

      def with_initial_substitutions
        # This join previously was joined to new lines.  This was changed to allow for
        # testing with a simple sentence--this will probably break in production.
        sentences.map do |sentence|
          sentence = sentence.join(" ")
          sentence.gsub!(/[^a-z]+$/i, '')
          sentence.gsub!(/\b[a-z]+ly/, 'adverb')
          sentence.gsub!(/\b[a-z]+ing/, 'verb')
          categorized_word_list.keys.inject(sentence) do |body, keyset|
            re = Regexp.union((keyset).flatten.map{|w| /\b#{Regexp.escape(w)}[ed]*\b/i})
            body.gsub(re, categorized_word_list[keyset].to_s)
          end
        end
      end

      def with_final_substitions
        @with_final_substitions ||= begin
          with_initial_substitutions.map do |sentence|
            re = Regexp.union((nouns).flatten.compact.map{|w| /\b#{Regexp.escape(w)}\b/i})
            sentence.gsub!(re, 'noun')
            re = Regexp.union((adjectives).flatten.compact.map{|w| /\b#{Regexp.escape(w)}\b/i})
            sentence.gsub!(re, 'adjective')
          end
        end
      end

      def sentences
        @sentence ||= begin
          text = corpus.gsub(/(#{Grammar::PartsOfSpeech::HONORIFICS * '|'})/i, '\1@@@')
          text = text.split(/[\.\?\!\;\,] /)
          text = text.map{|t| t.gsub('@@@', '')}
          text.map { |sentence| words_from(sentence) }
        end
      end

      def sentence_structures
        @sentence_structures ||= begin
          candidates = with_final_substitions.compact.uniq.select{|s| s.split.length < 12}
          candidates = candidates.select{|candidate| candidate.include?('noun')}
          candidates = candidates.select{|candidate| candidate.include?('verb')}
          candidates
        end
      end

      def categorized_word_list
        @categorized_word_list ||= begin
          list = {}
          Grammar::PartsOfSpeech::WORD_LIST.each do |key,values|
            list[key] = values.map{|word| [word, Lingua.stemmer(word)]}.flatten
          end
          list.invert
        end

      end

    end
  end
end