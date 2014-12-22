module MarkovGrammar
  class Conjunction

    include Mongoid::Document
    include Behavior::Agrees
    include Behavior::CanBeSampled
    include Disposition::HasPositivity

    validates_uniqueness_of :base_form

    field :base_form

  end
end