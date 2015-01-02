module Gramercy
  module Grammar
    module Structures

      # What is your favorite movie?
      class SimpleQuestionWithInterrogative

        include SentenceInitializer

        def conforms?
          begins_with_interrogative?
        end

        def subject
        end

        def interrogative
          interrogatives.first
        end

        def predicate
          (split_text[(verb_position + 1)..-1]).join(" ")
        end

        private

        def begins_with_interrogative?
          return if interrogatives.empty?
          split_text.index(interrogatives.first) <= split_text.size / 2
        end

        def interrogatives
          @interrogatives ||= (split_text & PartOfSpeech::Generic.where(type: 'interrogative').to_a).compact
        end

      end

      # Is the movie scary?
      class SimpleQuestion

        include SentenceInitializer

        def conforms?
          self.verb_position == 0
        end

        def interrogative
        end

        # TODO Split before the last article or adjective?
        def subject
          subject ||= begin
            phrases = noun_phrases[0..-2]
            phrases = phrases - Gramercy::PartOfSpeech::Generic.where(type: 'adjective', base_form: phrases).map(&:base_form)
            phrases = phrases - Gramercy::PartOfSpeech::Generic.where(type: 'pronoun', base_form: phrases).map(&:base_form)
            phrases.first
          end
        end

        def predicate
         (noun_phrases - [subject])[noun_phrases.index(subject.split(' ').last)..-1].join(' ')
        end

        def noun_phrases
          @noun_phrases ||= begin
            phrases = split_text[verb_position + 1..-1]
            phrases = phrases - Gramercy::PartOfSpeech::Generic.where(type: 'article', base_form: phrases).map(&:base_form)
            phrases
          end
        end

      end

    end
  end
end