module MarkovGrammar
  class Preposition

    include Mongoid::Document
    include Behavior::CanBeSampled

    validates_uniqueness_of :base_form

    field :base_form

  end
end