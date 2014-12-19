module MarkovGrammar
  module Behavior
    module Agrees

      def self.included(klass)
        klass.send(:attr_reader, :paired_word)
        klass.extend ClassMethods
      end

      def agrees_with(word)
        @paired_word = word
        self
      end

      def in(characteristic)
        return true unless self.respond_to?(characteristic)
        return true unless paired_word.respond_to?(characteristic)
        self.send(characteristic) == paired_word.send(characteristic)
      end

      module ClassMethods

        def agreeing_with(word, characteristics=[])
          scope = criteria
          characteristics.each do |characteristic|
            scope = scope.where(characteristic => word.send(characteristic))
          end
          scope
        end

      end

    end
  end
end