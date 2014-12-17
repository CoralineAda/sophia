require 'rubyfish'
require 'lingua/stemmer'

module Grammar
  module PartsOfSpeech

    WORD_LIST = {
      article:         %w{a the of an to},
      greeting:        %w{ hi hello evening morning hii hiii hiiii guten ohai hai ahoy yo heya},
      adverb:          %w{ enough not as beyond just actually very never always lately recently quickly slowly deliberately },
      conjunction:     %w{ accordingly after also although and assuming because before besides but consequently conversely even for furthermore hence how however if instead lest likewise meanwhile moreover nevertheless nonetheless nor now once or otherwise provided rather since so that so still than that then therefore though thus till unless until what whatever when whenever whereas whether which whichever while why yet wherever },
      interrogative:   %w{ how what who when where },
      number:          %w{ one two three four five six seven eight nine ten twenty thirty forty fifty sixty seventy eighty ninety hundred thousand million },
      preposition:     %w{ under over across about at by for from in into of on onto to toward towards with within without },
      pronoun:         %w{ there either neither him her his him hers they theirs them he she it its this those these that },
      action_verb:     %w{ kick join go use speak spoke annoy join pop burn flash hurry talk start stop jump eat fly walk run ran go say tell say said greet welcome thank do does did hurry },
      possessive_verb: %w{ get got have has had possess own rent hold held take took },
      identity_verb:   %w{ seem be been am are is was stop need want care owe exist },
      feeling_verb:    %w{ love hate feel like think thought },
      sensory_verb:    %w{ watch look feel felt see saw seen hear hear taste smell touch },
      creative_verb:   %w{ made make forge brew },
      transfer_verb:   %w{ donate drop gave give get hand pass pick take },
    }

    VERBS = WORD_LIST[:action_verb] +
            WORD_LIST[:possessive_verb] +
            WORD_LIST[:identity_verb] +
            WORD_LIST[:feeling_verb] +
            WORD_LIST[:sensory_verb] +
            WORD_LIST[:creative_verb] +
            WORD_LIST[:transfer_verb]

    NOUN_INDICATORS = WORD_LIST[:article]

    IDENTIFIERS = WORD_LIST[:article] + WORD_LIST[:number]

    PREDICATE_INDICATORS = WORD_LIST[:preposition] + NOUN_INDICATORS + VERBS

    def self.similar_to(original_word, test_word)
      return true if Lingua.stemmer(original_word.downcase) == Lingua.stemmer(test_word.downcase)
      distance = RubyFish::Hamming.distance(original_word, test_word)
      original_word.length > 5 && distance < original_word.length * 0.5 ? true : false
    end

    def self.probable_nouns_from(text)
      text = text.to_s
      re = Regexp.union((PREDICATE_INDICATORS).flatten.map{|w| /\b#{Regexp.escape(w)}\b/i})
      candidates = text.split(re).map(&:split).flatten.map(&:downcase)
      candidates.reject!{|c| PREDICATE_INDICATORS.include?(c) }
      candidates = candidates.map{|c| c.gsub(/[^a-zA-Z]/x, " ")}.compact
      candidates = candidates.map(&:split).flatten.compact
    end

  end
end
