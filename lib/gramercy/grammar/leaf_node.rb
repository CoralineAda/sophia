# Always a terminal node
module Gramercy
  module Grammar
    class LeafNode

      attr_reader :type, :word

      def initialize(word, type)
        @word = word
        @type = type
      end

    end
  end
end