module MarkovGrammar
  class Verb

    include Mongoid::Document
    include Grammar::NaiveTense

    has_and_belongs_to_many :dispositions
    has_and_belongs_to_many :contexts

    field :base_form
    field :is_transitive,  type: Boolean, default: false
    field :is_finite,      type: Boolean, default: false
    field :is_linking,     type: Boolean, default: false
    field :is_indicative,  type: Boolean, default: false
    field :is_imperative,  type: Boolean, default: false
    field :is_subjunctive, type: Boolean, default: false

    attr_accessor :person
    attr_accessor :plurality

    def requires_object?
      self.transitive?
    end

    def is_positive?
      self.disposition.positivity > 5
    end

    def is_negative?
      self.disposition.positivity < 5
    end

    def is_neutral?
      self.disposition == 5
    end

  end
end