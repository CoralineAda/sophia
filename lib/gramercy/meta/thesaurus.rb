module Gramercy
  module Meta
    class Thesaurus

      attr_reader :context, :root

      def initialize(context:, root:)
        @context = context
        @root = root
      end

      def synonyms
        self.context.words_with_positivity(positivity) - [self.root]
      end

      def antonyms
        self.context.words_with_positivity(positivity * - 1) - [self.root]
      end

      def related_roots
        self.context.words_with_positivity(0)
      end

      private

      def positivity
        self.root.positivity_in_context(context)
      end

    end
  end
end