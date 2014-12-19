module MarkovGrammar
  class Adjective

    include Mongoid::Document
    include Grammar::Stems
    include Behavior::CanBeSampled
    include Disposition::HasContext
    include Disposition::HasPositivity

    validates_uniqueness_of :base_form

    field :base_form

  end
end