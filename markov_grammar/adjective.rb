module MarkovGrammar
  class Adjective

    include Mongoid::Document
    include Grammar::Stems
    include Disposition::HasPositivity

    validates_uniqueness_of :base_form

    field :base_form
    field :context,       type: Array,   default: []

  end
end