module Gramercy
  module Grammar
    module Structures
      class SimpleQuestion < Sentence

        def subject
        end

        def predicate
          (split_text[(verb_position + 1)..-1]).join(" ")
        end

      end
    end
  end
end