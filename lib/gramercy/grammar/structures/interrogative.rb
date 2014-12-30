module Gramercy
  module Grammar
    module Structures

      # What is your favorite song?
      class SimpleInterrogative

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
          @interrogatives ||= (split_text & PartOfSpeech::Interrogative.base_forms).compact
        end

      end

      # Is the movie scary?
      class SimpleQuestion

        include SentenceInitializer

        def conforms?
          self.verb_position = 0
        end

        def subject
          noun_phrases.first
        end

        def predicate
          noun_phrases.last
        end

        def noun_phrases
          @noun_phrases ||= split_text.join(' ').split(all_articles)[1..-1]
        end

        private

        def all_articles
          @all_articles ||= PartOfSpeech::Article.base_forms
        end

      end


    end
  end
end