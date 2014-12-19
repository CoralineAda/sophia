module MarkovGrammar
  class Noun

    include Mongoid::Document
    include Grammar::Stems
    include Disposition::HasPositivity
    include Disposition::HasGender

    validates_uniqueness_of :base_form

    field :base_form
    field :plurality,     default: :singular
    field :is_proper,     type: Boolean, default: false
    field :is_countable,  type: Boolean, default: true
    field :is_collective, type: Boolean, default: false
    field :context,       type: Array,   default: []

    def self.from(candidate)
      where(stem: Lingua.stemmer(candidate)).first
    end

    def self.with_context(context)
      any_in(contexts: context)
    end

    def self.common
      where(is_proper: false)
    end

    def needs_article?
      self.is_countable && ! self.is_proper
    end

    # some, any, a little, a lot
    def needs_quantifier?
      ! self.is_countable
    end

    def plural
      return self.base_form unless self.is_countable
      self.base_form.pluralize
    end

    def possessive_singular
      form = "#{self.base_form}'s"
      form.gsub!(/s's/, "'")
    end

    def possessive_plural
      form = "#{plural}'s"
      form.gsub!(/s's/, "'")
    end

  end
end