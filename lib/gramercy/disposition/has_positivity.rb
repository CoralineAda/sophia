# TODO may want to make positivities simple integers, use 'degree' attr for intensity

module Gramercy
  module Disposition
    module HasPositivity

      POSITIVITIES = {
        positive: 5,
        negative: -5,
        neutral: 0
      }

      def self.included(klass)
        klass.send(:field, :disposition, type: Integer, default: 0)
        klass.extend(ClassMethods)
      end

      def has_positive_connotation?
        self.disposition > POSITIVITIES[:neutral]
      end

      def has_negative_connotation?
        self.disposition < POSITIVITIES[:neutral]
      end

      def is_neutral?
        self.disposition == POSITIVITIES[:neutral]
      end

      module ClassMethods

        def with_disposition(disposition)
          case disposition
          when :negative; where(disposition: POSITIVITIES[:negative])
          when :positive; where(disposition: POSITIVITIES[:positive])
          when :neutral;  where(disposition: POSITIVITIES[:neutral])
          end
        end
      end

    end
  end
end