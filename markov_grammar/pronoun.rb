module MarkovGrammar
  class Pronoun

    include Mongoid::Document
    include Disposition::HasGender
    include Behavior::CanBeSampled

    validates_uniqueness_of :base_form

    field :base_form
    field :person
    field :plurality,      default: :singular
    field :is_subjective,  type: Boolean, default: false
    field :is_objective,   type: Boolean, default: false
    field :is_possessive,  type: Boolean, default: false
    field :is_reflexive,   type: Boolean, default: false

    def self.personal
      where(is_subjective: true)
    end

  end
end