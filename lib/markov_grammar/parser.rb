module MarkovGrammar

  class Parser

    attr_accessor :corpus, :parsed_corpus

    def initialize(corpus="")
      self.corpus = corpus
    end

    def split_corpus
      @split_corpus = self.corpus.split.map do |word|
        word.gsub(/[^a-z]$/, '')
      end
    end

    def replace_nouns
      Grammar::PartsOfSpeech.probable_nouns_from(self.corpus).each do |noun|
        self.split_corpus.join(' ').gsub(noun, 'noun').split
      end
    end

    def parts_of_speech
      @parts_of_speech = Grammar::PartsOfSpeech::WORD_LIST.keys.map(&:to_s)
    end

    def noun_phrases
      bare_words.join(' ').split('|').reject{|w| w == '|'}.reject{|w| w == ' '}.reject(&:empty?).map(&:strip)
    end

    def adjectives
      noun_phrases.map do |phrase|
        split = phrase.split
        next if phrase.length == 1
        split[-2..0]
      end.compact.flatten.uniq
    end

    def nouns
      noun_phrases.map do |phrase|
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
      with_substitutions.split.map do |word|
        word = word.gsub(/[^a-z]+$/i, '')
        parts_of_speech.include?(word) ? '|' : word
      end
    end

    def with_substitutions
      substituted = split_corpus.join(' ').downcase
      categorized_word_list.keys.each do |keyset|
        re = Regexp.union((keyset).flatten.map{|w| /\b#{Regexp.escape(w)}[ed]*\b/i})
        substituted.gsub!(re, categorized_word_list[keyset].to_s)
      end
      substituted.gsub!(/[^a-z]+$/i, '')
      substituted.gsub!(/\b[a-z]+ly/, 'adverb')
      substituted
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