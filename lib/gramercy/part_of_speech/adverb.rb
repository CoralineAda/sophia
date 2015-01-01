module Gramercy
  module PartOfSpeech
    class Adverb

      include Neo4j::ActiveNode
      include Grammar::Stems
      include Behavior::Agrees

      validates_uniqueness_of :base_form

      property :base_form,       index: :exact
      property :is_manner,       type: Boolean, default: false
      property :is_place,        type: Boolean, default: false
      property :is_purpose,      type: Boolean, default: false
      property :is_frequency,    type: Boolean, default: false
      property :is_time,         type: Boolean, default: false
      property :is_completeness, type: Boolean, default: false
      property :is_verbal,       type: Boolean, default: true
      property :is_adjectival,   type: Boolean, default: false

      def self.base_forms
        all.map(&:base_form)
      end

      def self.verbal
        where(is_verbal: true)
      end

      def self.adjectival
        where(is_adjectival: true)
      end

      def self.non_geographic
        where(is_place: false)
      end

      def self.geographic
        where(is_place: true)
      end

    end
  end
end