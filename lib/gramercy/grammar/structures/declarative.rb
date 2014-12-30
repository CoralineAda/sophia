module Gramercy
  module Grammar
    module Structures
      class SimpleDeclarative < Sentence

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