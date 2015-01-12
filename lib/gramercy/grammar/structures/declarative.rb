module Gramercy
  module Grammar
    module Structures

      class Declarative

        attr_reader :split_text, :verb_positions, :verbs

        # FIXME more types of declarative sentences.
        SENTENCE_STRUCTURES = [
          'SimpleDeclarative'
        ]

        def self.parser(text: text, verb_positions: verb_positions, verbs: verbs)
          @structure ||= SENTENCE_STRUCTURES.each do |structure|
            candidate = class_eval(structure).new(text: text, verb_positions: verb_positions, verbs: verbs)
            return candidate if candidate.conforms?
          end
          return :declarative_parser_not_found
        end

        def initialize(text:, verb_positions:, verbs:)
          @split_text = text
          @verb_positions = verb_positions
          @verbs = verbs
        end

      end

      # Elpheba is my cat.
      class SimpleDeclarative < Declarative

        def conforms?
          true
        end

        def interrogative
        end

        def adjectives
          Gramercy::PartOfSpeech::Generic.where(type: 'adjective', base_form: noun_phrases).map(&:base_form)
        end

        def subject
          subject ||= begin
            phrases = noun_phrases[0..-2]
            phrases = phrases - Gramercy::PartOfSpeech::Generic.where(type: 'adjective', base_form: phrases).map(&:base_form)
            phrases = phrases - Gramercy::PartOfSpeech::Generic.where(type: 'pronoun', base_form: phrases).map(&:base_form)
            phrases.first
          end
        end

        def predicate
          noun_phrases[noun_phrases.index(subject)+1..-1].join(' ')
        end

        def noun_phrases
          @noun_phrases ||= begin
            phrases = split_text[0..verb_positions.first - 1] + split_text[verb_positions.first + 1..-1]
            phrases = phrases - Gramercy::PartOfSpeech::Generic.where(type: 'article', base_form: phrases).map(&:base_form)
            phrases
          end
        end

        def verb
          self.verbs.first
        end

      end
    end
  end
end