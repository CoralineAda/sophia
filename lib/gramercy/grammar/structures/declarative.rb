module Gramercy
  module Grammar
    module Structures

      # Elpheba is my cat.
      class SimpleDeclarative

        include SentenceInitializer

        def conforms?
          true
        end

        def interrogative
        end

        def subject
          (split_text[0..(verb_position - 1)]).join(" ")
        end

        def predicate
          (split_text[(verb_position + 1)..-1]).join(" ")
        end

      end
    end
  end
end