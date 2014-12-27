module Gramercy
  module Grammar
    class Parser

      attr_reader :text

      def initialize(text="")
        @text = text.downcase
      end

      def nouns
        [subject.split.last] + [predicate.split.last]
      end

      def parser
        @parser ||= SimpleDeclarative.new(self.split_text, position_of(verb))
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

      class SimpleDeclarative

        attr_reader :split_text, :verb_position

        def initialize(split_text, verb_position)
          @split_text = split_text
          @verb_position = verb_position
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