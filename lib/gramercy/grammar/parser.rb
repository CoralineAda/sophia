module Gramercy
  module Grammar
    class Parser

      attr_reader :sentence

      def initialize(sentence="")
        @sentence = sentence.downcase
      end

      def context
        Meta::Context.from(nouns).first
      end

      def contexts
        @contexts ||= Meta::Context.from(stemmed_words)
      end

      def positivity
        Gramercy::Meta::Context.
          query_as(:c).
          match('r-[e:EXPRESSED_AS]->(w)').
          where("w.base_form in #{stemmed_words}").
          return('DISTINCT w, e.positivity').
          sum(&:'e.positivity')
      end

      def sentence_node
        @sentence_node ||= Sentence.new(sentence)
      end

      def split_text
        @split_text ||= begin
          self.sentence.gsub(/[\.\?\!\,]/, '').split
        end
      end

      def stemmed_words
        @stemmed_words ||= split_text.map do |word|
          Lingua::Stemmer.new.stem(word)
        end.uniq
      end

    end
  end
end