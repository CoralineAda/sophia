module Gramercy
  module Grammar
    class Parser

      attr_reader :text

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

      def is_question?
        self.text =~ /\?$/
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
          if is_question?
            Structures::Interrogative.parser(text: split_text, verb_positions: verb_positions, verbs: verbs)
          else
            Structures::Declarative.parser(text: split_text, verb_positions: verb_positions, verbs: verbs)
          end
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
        parser.verb
      end

      def verb_positions
        verbs.map{|verb| position_of(verb)}
      end

      def verbs
        @verbs ||= (split_text & verb_forms)
      end

      def verb_forms
        @verb_forms ||= PartOfSpeech::Generic.where(type: 'verb').map(&:all_forms).flatten
      end

    end
  end
end