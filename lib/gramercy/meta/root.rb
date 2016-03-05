module Gramercy
  module Meta
    class Root

      include Neo4j::ActiveNode
      include Grammar::Stems

      property :base_form, index: :exact
      property :created_at, type: DateTime

      validates_presence_of :base_form
      validates_uniqueness_of :base_form

#      has_many :both, :contexts, rel_class: Meta::Context, rel_class: Meta::Expression, type: "contexts"
      has_many :both, :contexts, { rel_class: Meta::Context }
      has_many :out,  :in_form, { rel_class: PartOfSpeech::Generic }

      attr_accessor :positivity

      def self.all_with_context_names
        Gramercy::Meta::Root.as('root').contexts(:c).pluck('root.base_form, c.name').to_a
      end

      def positivity_in_context(context)
        context.positivity_of(self)
      end

   end
  end
end