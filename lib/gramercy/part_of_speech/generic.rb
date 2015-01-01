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
        adjective:      %w{ physical },
        adverb:         %w{ modifies type },
        article:        %w{ indefinite },
        conjunction:    [],
        interrogative:  %w{ determiner type },
        noun:           %w{ proper countable collective physical plural_form },
        preposition:    [],
        pronoun:        %w{ type subject_form object_form reflexive_form },
        verb:           %w{ identifying transitive intransitive linking s_form ed_form ing_form }
      }

      def self.base_forms
        all.map(&:base_form)
      end

      def set_property(name, value=true)
        self.properties << PartOfSpeech::Property.find_or_create_by(name: name.to_s, value: value)
      end

      def set_root(root)
        self.root = root
        self.root.forms << self
      end

    end
  end
end