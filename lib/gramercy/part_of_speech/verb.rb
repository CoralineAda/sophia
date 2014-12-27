#TODO negative forms of verbs
module Gramercy
  module PartOfSpeech
    class Verb

      include Mongoid::Document
      include Grammar::NaiveTense
      include Grammar::Stems
      include Behavior::Agrees
      include Behavior::CanBeSampled
      include Disposition::HasContext
      include Disposition::HasPositivity

      validates_uniqueness_of :base_form

      field :base_form
      field :is_identifying, type: Boolean, default: false # expresses identity
      field :is_transitive,  type: Boolean, default: false # requires an object
      field :is_finite,      type: Boolean, default: false # makes assertion
      field :is_linking,     type: Boolean, default: false # requires subject and object
      field :is_indicative,  type: Boolean, default: true  # used in statement or question
      field :is_imperative,  type: Boolean, default: false # imperative voice
      field :is_subjunctive, type: Boolean, default: false # use with if, as though, etc.
      field :s_form
      field :ed_form
      field :ing_form

      index({ base_form: 1 }, { unique: true })

      TENSES = [:present, :past, :present_participle]

      attr_accessor :person
      attr_accessor :plurality
      attr_accessor :form
      attr_accessor :tense

      def self.base_forms
        all.map(&:base_form)
      end

      def self.all_forms
        all.map(&:all_forms).flatten.uniq
      end

      def self.stems
        all.map(&:stem)
      end

      def self.finite
        where(is_finite: true)
      end

      def self.indicative
        where(is_indicative: true)
      end

      def self.linking
        where(is_linking: true)
      end

      def self.transitive
        where(is_transitive: true)
      end

      def self.identifying
        where(is_identifying: true)
      end

      def all_forms
        [
          self.base_form,
          self.in_s_form,
          self.in_ed_form,
          self.in_ing_form
        ]
      end

      def with_form(form)
        @form ||= form
      end

      def inject_adverb(adverb)
        verb_phrase = self.send(tense) if tense
        verb_phrase ||= self.send(form) if form
        verb_phrase ||= self.present
        verb_phrase = verb_phrase.split
        return "#{adverb} #{verb_phrase[0]}" if verb_phrase.size == 1
        "#{verb_phrase[-2..0].join(' ')} #{adverb} #{verb_phrase[-1]}"
      end

      def requires_object?
        self.transitive?
      end

    end
  end
end