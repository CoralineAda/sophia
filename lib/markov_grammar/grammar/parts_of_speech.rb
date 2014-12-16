module Grammar
  module PartsOfSpeech

    WORD_LIST = {
      articles:         %w{a the of an to},
      action_verbs:     %w{ eat fly walk run go say tell say said greet welcome thank do },
      possessive_verbs: %w{ have has had possess own rent hold held },
      identity_verbs:   %w{ am are is need want care owe exist },
      feeling_verbs:    %w{ love hate feel like think thought },
      sensory_verbs:    %w{ feel felt see saw see hear taste smell touch },
      creative_verbs:   %w{ made make forge brew },
      transfer_verbs:   %w{ donate drop gave give get hand pass pick take },
      greetings:        %w{hi hello evening morning hii hiii hiiii guten ohai hai ahoy yo heya},
      adverbs:          %w{ lately recently quickly slowly deliberately },
      conjunctions:     %w{ accordingly after also although and assuming because before besides but consequently conversely even for furthermore hence how however if instead lest likewise meanwhile moreover nevertheless nonetheless nor now once or otherwise provided rather since so that so still than that then therefore though thus till unless until what whatever when whenever whereas whether which whichever while why yet wherever },
      interrogatives:   %w{ how what who when where },
      numbers:          %w{ one two three four five six seven eight nine ten twenty thirty forty fifty sixty seventy eighty ninety hundred thousand million },
      prepositions:     %w{ about at by for from in into of on onto to toward towards with within without },
      pronouns:         %w{ him her his him hers they theirs them he she it its this those these that },
      titles:           ["dr.", "mr.", "ms.", "phd.", "mrs."]
    }

    VERBS = WORD_LIST[:action_verbs] +
            WORD_LIST[:possessive_verbs} +
            WORD_LIST[:identity_verbs] +
            WORD_LIST[:feeling_verbs] +
            WORD_LIST[:sensory_verbs] +
            WORD_LIST[:creative_verbs] +
            WORD_LIST[:transfer_verbs]

    NOUN_INDICATORS = DIRECT_LOOKUP[:articles]

    IDENTIFIERS = DIRECT_LOOKUP[:articles] + WORD_LIST[:numbers]

    PREDICATE_INDICATORS = WORD_LIST[:prepositions] + NOUN_INDICATORS + VERBS

    def self.similar_to(original_word, test_word)
      return true if original_word =~ /#{test_word}/i
      return true if test_word =~ /#{original_word}/i
      RubyFish::Hamming.distance(original_word, test_word) <= 5
    end

    def self.probable_nouns_from(text)
      text = text.to_s
      re = Regexp.union((PREDICATE_INDICATORS).flatten.map{|w| /\b#{Regexp.escape(w)}\b/i})
      candidates = text.split(re).map(&:split).flatten.map(&:downcase)
      candidates = candidates.reject{|c| NOUN_INDICATORS.include?(c}
      candidates = candidates.reject{|c| WORD_LIST[:prepositions].include?(c)}
      candidates = candidates.reject{|c| PREPOSITIONS.include?(c)}
      candidates = candidates.map{|c| c.gsub(/[^a-zA-Z]/x, " ")}.compact
      candidates = candidates.map(&:split).flatten.compact
    end

  end
end
