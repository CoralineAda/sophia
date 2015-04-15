module Gramercy
  module Grammar
    class Sentence < BranchNode

      attr_reader :sentence

      def initialize(sentence)
        @sentence = sentence
        super(type: :sentence, children: parsed)
      end

      def parsed
        [
          BranchNode.new(type: :subject_phrase, children: tokenized_words(subject_phrase)),
          LeafNode.new(verb, :verb),
          BranchNode.new(type: :object_phrase, children: tokenized_words(object_phrase))
        ]
      end

      private

      def adjectives
        if articles.first
          split_text[position_of(articles.first) + 1..-2]
        else
          split_text[0..-2]
        end
      end

      def articles
        Gramercy::PartOfSpeech::Generic.where(
          type: 'article',
          base_form: split_text
        ).map(&:base_form)
      end

      def sentence_with_leaf_nodes
      end

      def split_text
        @split_text ||= self.sentence.split(/\s+/)
      end

      # fails on "Is John the fattest president?" by returning "John the"
      def subject_phrase
        if position_of(verb) == 0
          (split_text - [verb])[0..((split_text - [verb]).index(articles.last) - 1)]
        else
          split_text - verb_phrase
        end
      end

      def noun_phrases
        [subject_phrase, object_phrase]
      end

      def object_phrase
        if position_of(verb) == 0
          (split_text - [verb])[(split_text - [verb]).index(articles.last)..-1]
        else
          verb_phrase - [verb]
        end
      end

      def part_of_speech(word)
        return :article if articles.include?(word)
        return :adjective if adjectives.include?(word)
        return :noun
      end

      def tokenized_words(words)
        words.map{ |word| LeafNode.new(word, part_of_speech(word)) }
      end

      def verb_phrase
        @verb_phrase ||= split_text[position_of(verb)..-1]
      end

      def verb
        @verb ||= split_text.flat_map do |word|
          PartOfSpeech::Generic.verbs_with_form_matching(word).any? && word
        end.reject(&:!).first
      end

    end
  end
end
