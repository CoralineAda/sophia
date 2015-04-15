# Always a terminal node
module Gramercy
  module Grammar
    class LeafNode

      attr_reader :type, :word

      def self.from(words, type: :unknown)
        words.map{ |word| new(word, type) }
      end

      def initialize(word, type)
        @word = word
        @type = type
      end

      # FIXME
      def part_of_speech
        type != :unknown && type || :something
      end

    end
  end
end