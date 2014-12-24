module MarkovGrammar
  class Preposition

    include Mongoid::Document
    include Behavior::CanBeSampled

    validates_uniqueness_of :base_form

    field :base_form

    def self.base_forms
      all.map(&:base_form)
    end

  end
end