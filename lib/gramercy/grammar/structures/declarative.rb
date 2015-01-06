module Gramercy
  module Grammar
    module Structures

      class Declarative

        attr_reader :split_text, :verb_position

        # FIXME more types of declarative sentences.
        SENTENCE_STRUCTURES = [
          'SimpleDeclarative'
        ]

        def self.parser(split_text, verb_position)
          @structure ||= SENTENCE_STRUCTURES.each do |structure|
            candidate = class_eval(structure).new(split_text, verb_position)
            return candidate if candidate.conforms?
          end
        end

      end

      # Elpheba is my cat.
      class SimpleDeclarative < Declarative

        def initialize(split_text, verb_position)
          @split_text = split_text
          @verb_position = verb_position
        end

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