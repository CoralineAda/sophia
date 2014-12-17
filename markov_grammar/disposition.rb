module MarkovGrammar
  class Disposition

    include ::Mongoid::Document

    has_and_belongs_to_many :verbs

    field :name
    field :positivity

  end
end