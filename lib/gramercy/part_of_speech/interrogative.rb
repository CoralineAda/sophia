module Gramercy
  module PartOfSpeech
    class Interrogative

      include Mongoid::Document
      include Behavior::Agrees
      include Behavior::CanBeSampled

      TYPES = %w{ personal impersonal location source goal time manner reason choice }

      field :base_form
      field :is_determiner, type: Boolean, default: false
      field :is_pronoun,    type: Boolean, default: false
      field :is_proadverb,  type: Boolean, default: false
      field :type

      index({ base_form: 1 }, { unique: true })

      validates_uniqueness_of :base_form
      validates_inclusion_of :type, in: TYPES

      def self.base_forms
        all.map(&:base_form)
      end

    end
  end
end