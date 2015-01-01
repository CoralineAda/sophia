module Gramercy
  module PartOfSpeech
    class Noun

      include Mongoid::Document
#      include Grammar::Stems
      include Behavior::Agrees
#      include Disposition::HasGender

      validates_uniqueness_of :base_form

      field :base_form
      field :plurality,     default: :singular
      field :is_proper,     type: Boolean, default: false
      field :is_countable,  type: Boolean, default: true
      field :is_collective, type: Boolean, default: false
      field :is_physical,   type: Boolean, default: false
      field :plural_form
      field :synonyms,      type: Array,   default: []

      index({ base_form: 1 }, { unique: true })

      attr_accessor :enable_synonyms

      def self.base_forms
        all.map(&:base_form)
      end

      def self.common
        where(is_proper: false)
      end

      def self.proper
        where(is_proper: true)
      end

      def self.construct(candidate)
        noun = new(base_form: candidate)
        noun.is_proper = noun.base_form.capitalize == noun.base_form
        noun
      end

      def self.fallback
        new(base_form: ['thing', 'something'].sample)
      end

      def self.from(candidate)
        where(stem: Lingua.stemmer(candidate)).first || construct(candidate)
      end

      def base_form_or_synonym
        return self.base_form unless enable_synonyms && self.synonyms.any?
        [[self.base_form], self.synonyms].sample.sample
      end

      def needs_article?
        self.is_countable && ! self.is_proper
      end

      # some, any, a little, a lot
      def needs_quantifier?
        ! self.is_countable
      end

      def plural
        return self.base_form_or_synonym unless self.is_countable
        self.plural_form || self.base_form_or_synonym.pluralize
      end

      def possessive_singular
        form = "#{self.base_form_or_synonym}'s"
        form.gsub(/s's/, "s'")
      end

      def possessive_plural
        form = "#{plural}'s"
        form.gsub(/s's/, "s'")
      end

    end
  end
end