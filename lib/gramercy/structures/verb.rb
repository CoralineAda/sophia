module Gramercy
  module Structures
    class Verb

      attr_reader :verb, :adverb

      def initialize(verb:, adverb:)
        @verb = verb
        @adverb = adverb
      end

      def in_form
        verb.inject_adverb(adverb)
      end

    end
  end
end