module MarkovGrammar
  module Disposition
    module HasGender

      FEMININE = 10
      MASCULINE = 0
      NEUTRAL = 5
      NONE = -1

      def self.included(klass)
        klass.send(:field, :gender, type: Integer, default: -1)
        klass.extend(ClassMethods)
      end

      def is_masculine?
        self.gender < NEUTRAL && self.gender > NONE
      end

      def is_feminine?
        self.gender > NEUTRAL
      end

      def is_neutral?
        self.gender == NEUTRAL
      end

      def is_not_gendered?
        self.gender == NONE
      end

      module ClassMethods

        def feminine
          where(:gender.gt => NEUTRAL)
        end

        def masculine
          where(:gender.gt => NONE, :gender.lt => NEUTRAL)
        end

        def neutral
          where(:gender => NEUTRAL)
        end

        def not_gendered
          where(:gender => NONE)
        end

      end

    end
  end
end