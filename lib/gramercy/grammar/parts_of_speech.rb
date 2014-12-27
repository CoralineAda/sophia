require 'rubyfish'
require 'lingua/stemmer'

module Gramercy
  module Grammar
    module PartsOfSpeech

      WORD_LIST = {
        article:         Gramercy::PartOfSpeech::Article.all.map(&:base_form),
        greeting:        %w{ hi hello evening morning hii hiii hiiii guten ohai hai ahoy yo heya},
        adverb:          Gramercy::PartOfSpeech::Adverb.all.map(&:base_form),
        conjunction:     Gramercy::PartOfSpeech::Conjunction.all.map(&:base_form),
        interrogative:   Gramercy::PartOfSpeech::Interrogative.all.map(&:base_form),
        number:          %w{ one two three four five six seven eight nine ten twenty thirty forty fifty sixty seventy eighty ninety hundred thousand million },
        preposition:     Gramercy::PartOfSpeech::Preposition.all.map(&:base_form),
        pronoun:         Gramercy::PartOfSpeech::Pronoun.all.map(&:base_form)
     }

      HONORIFICS = %w{dr. mr. ms. mrs. rev.}
      NOUN_INDICATORS = WORD_LIST[:article]
      VERB_INDICATORS = WORD_LIST[:interrogative]
      IDENTIFIERS = WORD_LIST[:article] + WORD_LIST[:number]
      PREDICATE_INDICATORS = WORD_LIST[:preposition] + NOUN_INDICATORS

      def self.similar_to(original_word, test_word)
        return true if Lingua.stemmer(original_word.downcase) == Lingua.stemmer(test_word.downcase)
        distance = RubyFish::Hamming.distance(original_word, test_word)
        original_word.length > 5 && distance < original_word.length * 0.5 ? true : false
      end

      def self.probable_verbs_from(text)
        forms = Gramercy::PartOfSpeech::Verb.all_forms
        text.split.select{|word| p word; forms.include? word}
      end

      def self.non_nouns
        WORD_LIST.invert.keys.flatten.reject!{ |w| WORD_LIST[:pronoun].include? w }
      end

      def self.probable_nouns_from(text)
        text = text.to_s
        re = Regexp.union((PREDICATE_INDICATORS).flatten.map{|w| /\b#{Regexp.escape(w)}\b/i})
        candidates = text.split(re).map(&:split).flatten.map(&:downcase)
        candidates = candidates.reject{ |c| non_nouns.include?(c) }
        candidates = candidates.reject{ |c| Gramercy::PartOfSpeech::Verb.all_forms.include?(c) }
        candidates = candidates.map{ |c| c.gsub(/[^a-zA-Z]/x, " ") }.compact
        candidates = candidates.map(&:split).flatten.compact
      end

    end
  end
end