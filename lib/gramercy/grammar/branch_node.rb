module Gramercy
  module Grammar
    class BranchNode

      attr_reader :type

      def initialize(type:, children:)
        @type = type
        @children = children
      end

      def children
        self.children.dup
      end

      private

      attr_reader :children

      def position_of(word)
        split_text.index(word)
      end

      def split_text
        self.text.split(' ')
      end

    end

  end
end
