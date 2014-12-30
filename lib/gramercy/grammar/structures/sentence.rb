module Gramercy
  module Grammar
    module Structures
      class Sentence

        attr_reader :split_text, :verb_position

        def initialize(split_text, verb_position)
          @split_text = split_text
          @verb_position = verb_position
        end

      end
    end
  end
end