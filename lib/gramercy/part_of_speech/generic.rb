module Gramercy
  module PartOfSpeech
    class Generic

      include Neo4j::ActiveNode

      validates_uniqueness_of :base_form, context: :type

      property :base_form, index: :exact
      property :type

      has_one :both, :root, model_class: Meta::Root
      has_many :out, :properties, model_class: PartOfSpeech::Property

      PARTS_OF_SPEECH = %w{ adjective adverb article conjunction interrogative noun preposition pronoun verb}

      PROPERTY_LIST = {
        adjective:      {
                          boolean_values: %w{ physical },
                          textual_values: %w{ }
                        },
        adverb:         {
                          boolean_values: %w{ },
                          textual_values: %w{ modifies type }
                        },
        article:        {
                          boolean_values: %w{ indefinite },
                          textual_values: %w{ }
                        },
        conjunction:    {
                          boolean_values: %w{ },
                          textual_values: %w{ }
                        },
        interrogative:  {
                          boolean_values: %w{ determiner },
                          textual_values: %w{ type }
                        },
        noun:           {
                          boolean_values: %w{ proper countable collective physical },
                          textual_values: %w{ plural_form }
                        },
        preposition:    {
                          boolean_values: %w{ },
                          textual_values: %w{ }
                        },
        pronoun:        {
                          boolean_values: %w{ },
                          textual_values: %w{ type subject_form object_form reflexive_form }
                        },
        verb:           {
                          boolean_values: %w{ identifying transitive intransitive linking  },
                          textual_values: %w{ s_form ed_form ing_form }
                        }
      }

      def self.base_forms
        all.map(&:base_form)
      end

      def set_property(name, value)
        self.properties << PartOfSpeech::Property.find_or_create_by(name: name.to_s, value: value)
      end

      def set_root(root)
        self.root = root
        self.root.forms << self
      end

    end
  end
end