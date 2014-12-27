module Gramercy
  module Grammar
    class Parser

      attr_reader :text

      def initialize(text="")
        @text = text.downcase
      end

      def subject
        (split_text[0..(position_of(verb)-1)]).join(" ")
      end

      def object
        (split_text[(position_of(verb) + 1)..-1]).join(" ")
      end

      def verb
        (split_text & verb_forms).first
      end

      def verb_forms
        @verb_forms ||= PartOfSpeech::Verb.all_forms
      end

      def position_of(word)
        split_text.index(word)
      end

      def split_text
        @split_text ||= begin
          split = self.text.gsub(/#{Grammar::PartsOfSpeech::HONORIFICS * "|"}/i, '\1@@@')
          split.gsub(/[\.\?\!]/, '').split.map{|w| w.gsub('@@@', '')}
        end
      end

    end
  end
end