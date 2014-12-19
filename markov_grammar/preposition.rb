module MarkovGrammar
  class Preposition

    include Mongoid::Document

    validates_uniqueness_of :base_form

    field :base_form

  end
end