module MarkovGrammar
  class Verb

    include Mongoid::Document
    include Grammar::NaiveTense
    include Grammar::Stems
    include Disposition::HasPositivity

    has_and_belongs_to_many :contexts
    validates_uniqueness_of :base_form

    field :base_form
    field :is_regular,     type: Boolean, default: true
    field :is_identifying, type: Boolean, default: false # expresses identity
    field :is_transitive,  type: Boolean, default: false # requires an object
    field :is_finite,      type: Boolean, default: false # makes assertion
    field :is_linking,     type: Boolean, default: false # requires subject and object
    field :is_indicative,  type: Boolean, default: true  # used in statement or question
    field :is_imperative,  type: Boolean, default: false # imperative voice
    field :is_subjunctive, type: Boolean, default: false # use with if, as though, etc.
    field :s_form
    field :ed_form
    field :ing_form

    attr_accessor :person
    attr_accessor :plurality

    def self.finite
      where(is_finite: true)
    end

    def self.indicative
      where(is_indicative: true)
    end

    def self.transitive
      where(is_transitive: true)
    end

    def self.identifying
      where(is_identifying: true)
    end

    def requires_object?
      self.transitive?
    end

  end
end