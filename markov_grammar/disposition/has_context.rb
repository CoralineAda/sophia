module MarkovGrammar
  module Disposition
    module HasContext

      def self.included(klass)
        klass.send(:field, :contexts, type: Array, default: [])
        klass.extend(ClassMethods)
      end

      module ClassMethods
        def with_context(context)
          any_in(contexts: context)
        end
      end

    end
  end
end