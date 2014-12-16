module MarkovGrammar

  class Parser

    attr_accessor :corpus

    def initialize(corpus="")
      self.corpus = corpus
    end

    def identify_parts_of_speech
      split_corpus = self.corpus.split
      parsed_corpus = []
      Grammar::PartsOfSpeech::WORD_LIST.each do |kind, words|
        words.each do |word|
          parsed_corpus << split_corpus.map do |w|
            if Grammar::PartsOfSpeech.similar_to(w, word)
              kind
            else
              w
            end
          end
        end
      end
    end

  end
end