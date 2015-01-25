module Gramercy
  module Grammar
    module Structures

      class Interrogative

        attr_reader :split_text, :verb_positions, :verbs

        SENTENCE_STRUCTURES = [
          'SimpleQuestionWithInterrogative',
          'PropertyQuestion',
          'SimpleQuestion',
        ]

        def self.parser(text:, verb_positions:, verbs:)
          @structure ||= SENTENCE_STRUCTURES.each do |structure|
            candidate = class_eval(structure).new(text: text, verb_positions: verb_positions, verbs: verbs)
            return candidate if candidate.conforms?
          end
          return :parser_not_found
        end

        def initialize(text:, verb_positions:, verbs:)
          @split_text = text
          @verb_positions = verb_positions
          @verbs = verbs
        end

        def begins_with_interrogative?
          interrogatives.any?
        end

        def interrogatives
          @interrogatives ||= (split_text & PartOfSpeech::Generic.where(type: 'interrogative').map(&:base_form).to_a).compact
        end

        def object
          return predicate unless article = PartOfSpeech::Generic.find_by(type: 'article', base_form: predicate.split)
          (predicate.split - descriptors - [article]).last
        end

        def descriptors
          noun_phrases.map do |phrase|
            Gramercy::PartOfSpeech::Generic.where(
              type: 'adjective',
              base_form: phrase.split
            ).map(&:base_form)
          end.flatten.compact
        end

      end

      # What is your favorite movie?
      class SimpleQuestionWithInterrogative < Interrogative

        def conforms?
          begins_with_interrogative?
        end

        def subject
        end

        def adjectives
          Gramercy::PartOfSpeech::Generic.where(type: 'adjective', base_form: noun_phrases).map(&:base_form)
        end

        def interrogative
          interrogatives.first
        end

        def predicate
          (split_text[(verb_positions.first + 1)..-1]).join(" ")
        end

        def verb
          self.verbs.first
        end

      end

      # Does the movie have a monster?
      class PropertyQuestion < Interrogative

        def conforms?
          self.verb_positions.count > 1 && ! begins_with_interrogative? && subject
        end

        def interrogative
        end

        def adjectives
          Gramercy::PartOfSpeech::Generic.where(type: 'adjective', base_form: noun_phrases).map(&:base_form)
        end

        def verb
          self.verbs.last
        end

        # TODO Split before the last article or adjective?
        def subject
          @subject ||= begin
            phrases = noun_phrases[0..-2]
            phrases = phrases - Gramercy::PartOfSpeech::Generic.where(type: ['adjective', 'pronoun'], base_form: phrases).map(&:base_form)
            phrases.first
          end
        end

        def predicate
         (noun_phrases - [subject])[noun_phrases.index(subject.split(' ').last)..-1].join(' ')
        end

        def noun_phrases
          @noun_phrases ||= begin
            phrases = split_text[verb_positions.first + 1..verb_positions.last - 1] + split_text[verb_positions.last + 1..-1]
            phrases = phrases - Gramercy::PartOfSpeech::Generic.where(type: 'article', base_form: phrases).map(&:base_form)
            phrases = phrases - verbs
          end
        end

        def verb_position
          position_of(verbs.last)
        end

      end

      # Is the movie scary?
      class SimpleQuestion < Interrogative

        def conforms?
          self.verb_positions.first == 0
        end

        def interrogative
        end

        def adjectives
          Gramercy::PartOfSpeech::Generic.where(type: 'adjective', base_form: noun_phrases).map(&:base_form)
        end

        # TODO Split before the last article or adjective?
        def subject
          @subject ||= begin
            phrases = noun_phrases[0..-2]
            phrases = phrases - Gramercy::PartOfSpeech::Generic.where(type: ['adjective', 'pronoun'], base_form: phrases).map(&:base_form)
            phrases.first
          end
        end

        def predicate
          (noun_phrases - [subject])[noun_phrases.index(subject.split(' ').last)..-1].join(' ')
        end

        def noun_phrases
          @noun_phrases ||= begin
            phrases = split_text[verb_positions.first + 1..-1]
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