module MarkovGrammar
  class Verb

    include Mongoid::Document
    include Grammar::NaiveTense

    has_many :moods

    field :base_form
    field :past_form
    field :present_participle
    field :past_participle
    field :transitive?,  type: Boolean, default: false
    field :finite?,      type: Boolean, default: false
    field :linking?,     type: Boolean, default: false
    field :indicative?,  type: Boolean, default: false
    field :imperative?,  type: Boolean, default: false
    field :subjunctive?, type: Boolean, default: false

    def requires_object?
      self.transitive?
    end

  end
end