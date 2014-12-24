module MarkovGrammar
  class Adverb

    include Mongoid::Document
    include Grammar::Stems
    include Behavior::Agrees
    include Behavior::CanBeSampled
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
    field :is_verbal,       type: Boolean, default: true
    field :is_adjectival,   type: Boolean, default: false

    index({ base_form: 1 }, { unique: true })

    def self.base_forms
      all.map(&:base_form)
    end

    def self.verbal
      where(is_verbal: true)
    end

    def self.adjectival
      where(is_adjectival: true)
    end

    def self.non_geographic
      where(is_place: false)
    end

    def self.geographic
      where(is_place: true)
    end

  end
end