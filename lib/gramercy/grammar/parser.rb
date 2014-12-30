module Gramercy
  module Grammar
    class Parser

      attr_reader :text

      def initialize(text="")
        @text = text.downcase
      end

      def context
        Meta::Context.from(nouns)
      end

      def interrogative
        (split_text & Grammar::PartsOfSpeech::WORD_LIST[:interrogative]).first
      end

      def is_question?
        self.text =~ /\?$/
      end

      def nouns
        ([subject.to_s.split.last] + [predicate.to_s.split.last]).compact
      end

      def parser
        @parser ||= begin
          if is_question?
            Structures::SimpleQuestion.new(split_text, position_of(verb))
          else
            Structures::SimpleDeclarative.new(split_text, position_of(verb))
          end
        end
      end

      def position_of(word)
        split_text.index(word)
      end

      def predicate
        parser.predicate
      end

      def split_text
        @split_text ||= begin
          split = self.text.gsub(/#{Grammar::PartsOfSpeech::HONORIFICS * "|"}/i, '\1@@@')
          split.gsub(/[\.\?\!]/, '').split.map{|w| w.gsub('@@@', '')}
        end
      end

      def subject
        parser.subject
      end

      def verb
        (split_text & verb_forms).first
      end

      def verb_forms
        @verb_forms ||= PartOfSpeech::Verb.all_forms
      end

    end
  end
end