module MarkovGrammar
  class Context

    include ::Mongoid::Document

    has_and_belongs_to_many :verbs
    has_and_belongs_to_many :nouns
    has_and_belongs_to_many :adjectives
    validates_uniqueness_of :name

    field :name

  end
end