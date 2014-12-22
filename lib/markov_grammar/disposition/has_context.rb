module MarkovGrammar
  module Disposition
    module HasContext

      def self.included(klass)
        klass.send(:field, :contexts, type: Array, default: [])
        klass.extend(ClassMethods)
      end

      module ClassMethods

        def by_all_contexts
          MarkovGrammar::Meta::Context.all.inject({}) do |h, context|
            h[context] = with_context(context).map(&:base_form)
            h
          end
        end

        def by_defined_contexts
          defined_contexts.inject({}) do |h, context|
            h[context] = with_context(context).map(&:base_form)
            h
          end
        end

        def defined_contexts
          all.map(&:contexts).flatten.uniq
        end

        def with_context(context)
          return criteria if context == :any
          any_in(contexts: context)
        end

        def with_random_context
          any_in(contexts: defined_contexts.sample)
        end

      end

    end
  end
end