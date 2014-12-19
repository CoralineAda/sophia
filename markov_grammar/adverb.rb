module MarkovGrammar
  class Adverb

    include Mongoid::Document
    include Grammar::Stems
    include Disposition::HasContext
    include Disposition::HasPositivity

    validates_uniqueness_of :base_form

    field :base_form
    field :is_manner,       type: Boolean, default: false
    field :is_place,        type: Boolean, default: false
    field :is_purpose,      type: Boolean, default: false
    field :is_frequency,    type: Boolean, default: false
    field :is_time,         type: Boolean, default: false
    field :is_completeness, type: Boolean, default: false

  end
end