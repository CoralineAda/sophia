module MarkovGrammar
  class Context

    include ::Mongoid::Document

    has_and_belongs_to_many :dispositions
    has_and_belongs_to_many :verbs

    field :name
    field :description

  end
end