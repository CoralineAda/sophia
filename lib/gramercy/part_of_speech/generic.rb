module Gramercy
  module PartOfSpeech
    class Generic

      include Neo4j::ActiveNode
      include Grammar::NaiveTense

      validate :unique_within_type

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
                          boolean_values: %w{ transitive intransitive linking  },
                          textual_values: %w{ s_form ed_form ing_form }
                        }
      }

      def self.base_forms
        all.map(&:base_form)
      end

      def self.join_article_and_noun(article_in_form, noun_in_form)
        return "#{article_in_form} #{noun_in_form}" unless article_in_form == "a" || article_in_form == "an"
        %w{a e i o}.include?(noun_in_form[0]) ? "an #{noun_in_form}" : "a #{noun_in_form}"
      end

      def all_forms
        return unless self.type == 'verb'
        [
          self.base_form,
          self.in_s_form,
          self.in_ed_form,
          self.in_ing_form
        ]
      end

      def person
        return unless my_person = self.properties.where(name: "person")
        my_person.value
      end

      def plural
        return self.base_form_or_synonym unless self.is_countable
        self.plural_form || self.base_form_or_synonym.pluralize
      end

      def plurality
        return unless my_plurality = self.properties.where(name: "plurality")
        my_plurality.value
      end

      def possessive_singular
        form = "#{self.base_form_or_synonym}'s"
        form.gsub(/s's/, "s'")
      end

      def possessive_plural
        form = "#{plural}'s"
        form.gsub(/s's/, "s'")
      end

      def set_property(name, value)
        self.properties << PartOfSpeech::Property.find_or_create_by(name: name.to_s, value: value)
      end

      def set_root(root)
        self.root = root
        self.root.forms << self
      end

      def unique_within_type
        return true unless existing = self.class.where(base_form: self.base_form, type: self.type).first
        return true if self.type == "pronoun"
        if existing && existing != self
          self.errors[:base] << "record already exists with base_form #{self.base_form} and type #{self.type}"
        else
          return true
        end
      end

    end
  end
end