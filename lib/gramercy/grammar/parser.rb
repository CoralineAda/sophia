module Gramercy
  module Grammar
    class Parser

      attr_reader :text

      STRUCTURES = {
        question: [
          Structures::SimpleQuestionWithInterrogative,
          Structures::SimpleQuestion
        ],
        statement: [
          Structures::SimpleDeclarative
        ]
      }

      def initialize(text="")
        @text = text.downcase
      end

      def context
        Meta::Context.from(nouns).first
      end

      def contexts
        @contexts ||= Meta::Context.from(nouns)
      end

      def positivity
        Gramercy::Meta::Context.
          query_as(:c).
          match('r-[e:EXPRESSED_AS]->(w)').
          where("w.base_form in #{split_text}").
          return('DISTINCT w, e.positivity').
          sum(&:'e.positivity')
      end

      def interrogative
        parser.interrogative
      end

      def sentence_type
        return :question if self.text =~ /\?$/
        :statement
      end

      def nouns
        ([subject.to_s.split.last] + [predicate.to_s.split.last]).compact
      end

      # FIXME Implement this a better way than initializing the parser class 2x!
      def parser
        @parser ||= begin
          STRUCTURES[sentence_type].detect do |structure|
            candidate = structure.new(split_text, position_of(verb))
            candidate.conforms? && candidate
          end.new(split_text, position_of(verb))
        end
      end

      def position_of(word)
        split_text.index(word)
      end

      def predicate
        begin
          parser.predicate
        rescue Exception => e
          puts "#{e}"
          '-'
        end
      end

      def split_text
        @split_text ||= begin
          # split = self.text.gsub(/#{Grammar::PartsOfSpeech::HONORIFICS * "|"}/i, '\1@@@')
          self.text.gsub(/[\.\?\!]/, '').split.map{|w| w.gsub('@@@', '')}
        end
      end

      def subject
        begin
          parser.subject
        rescue Exception => e
          puts "#{e}"
          puts "#{e.backtrace}"
          '-'
        end
      end

      def verb
        (split_text & verb_forms).first
      end

      def verb_forms
        @verb_forms ||= PartOfSpeech::Generic.where(type: 'verb').map(&:all_forms).flatten
      end

    end
  end
end