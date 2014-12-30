module Gramercy
  module Grammar
    module Structures
      module SentenceInitializer

        def self.included(klass)
          klass.send(:attr_reader, :split_text, :verb_position)
        end

        def initialize(split_text, verb_position)
          @split_text = split_text
          @verb_position = verb_position
        end

      end
    end
  end
end