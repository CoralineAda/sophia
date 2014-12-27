module Gramercy
  module PartOfSpeech
    class Preposition

      include Mongoid::Document
      include Behavior::CanBeSampled

      validates_uniqueness_of :base_form

      field :base_form

      index({ base_form: 1 }, { unique: true })

      def self.base_forms
        all.map(&:base_form)
      end

    end
  end
end