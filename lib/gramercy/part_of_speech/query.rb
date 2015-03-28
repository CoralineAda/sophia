module Gramercy
  module PartOfSpeech
    class Query

      attr_reader :word, :kind

      def self.find(word, kind)
        new(word, kind).results
      end

      def initialize(word, kind)
        @word = word
        @kind = kind
      end

      def results
        exact_matches | property_matches
      end

      private

      def exact_matches
        Generic.query_as(:w).
          match('(v:`Gramercy::PartOfSpeech::Generic`)').
          where("v.type = '#{self.kind}' AND v.base_form = '#{self.word}'").
          return('DISTINCT v').map(&:v)
      end

      def property_matches
        Generic.query_as(:w).
          match('(v:`Gramercy::PartOfSpeech::Generic`)-[PROPERTIES]->(p:`Gramercy::PartOfSpeech::Property`)').
          where("v.type = '#{self.kind}' AND p.value = '#{self.word}'").
          return('DISTINCT v').map(&:v)
      end

    end
  end
end