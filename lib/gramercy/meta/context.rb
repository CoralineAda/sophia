module Gramercy
  module Meta
    class Context

      include Neo4j::ActiveNode

      property :name, index: :exact
      property :created_at
      property :updated_at

      validates_presence_of :name
      validates_uniqueness_of :name

      has_many :both, :roots, model_class: Meta::Root, rel_class: Meta::Expression

      def self.from(words)
        query_as(:c).match('s-[EXPRESSED_AS]->n1').where("n1.base_form in#{words}").pluck(:c).first
      end

      def add_expression(root, positivity=0)
        Meta::Expression.create(from_node: self, to_node: root, positivity: positivity)
      end

      def words_with_positivity(positivity)
        roots.query_as(:w).match('s-[EXPRESSED_AS]->n2').where("EXPRESSED_AS.positivity = #{positivity}").pluck('DISTINCT n2')
      end

      def positive_expressions
        roots.query_as(:w).match('s-[EXPRESSED_AS]->n2').where('EXPRESSED_AS.positivity > 0').pluck('DISTINCT n2')
      end

      def negative_expressions
        roots.query_as(:w).match('s-[EXPRESSED_AS]->n2').where('EXPRESSED_AS.positivity < 0').pluck('DISTINCT n2')
      end

      def neutral_expressions
        roots.query_as(:w).match('s-[EXPRESSED_AS]->n2').where('EXPRESSED_AS.positivity = 0').pluck('DISTINCT n2')
      end

    end
  end
end