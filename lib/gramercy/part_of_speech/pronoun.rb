module Gramercy
  module PartOfSpeech
    class Pronoun

      include Mongoid::Document
      include Behavior::Agrees
#      include Disposition::HasGender

      validates_uniqueness_of :base_form

      field :base_form
      field :person
      field :plurality,      default: :singular
      field :is_subjective,  type: Boolean, default: false
      field :is_objective,   type: Boolean, default: false
      field :is_possessive,  type: Boolean, default: false
      field :is_reflexive,   type: Boolean, default: false

      index({ base_form: 1 }, { unique: true })

      def self.base_forms
        all.map(&:base_form)
      end

      def self.personal
        where(is_subjective: true)
      end

    end
  end
end