module Gramercy
  module Meta
    class Context

      include Neo4j::ActiveNode

      property :name, index: :exact
      property :created_at
      property :updated_at

      validates_presence_of :name
      validates_uniqueness_of :name

      has_many :both, :roots, model_class: Meta::Root, rel_class: Meta::Expression, type: 'expressed_as'

      def self.from(words)
        query_as(:w).match(n:Gramercy::Meta::Context).
                     optional_match('(n)-[EXPRESSED_AS]->(r)').
                     where("r.base_form in #{words}").
                     return('n, count(r) as c').
                     order_by('c desc').
                     to_a.
                     reject{|n| n.c == 0}.
                     map(&:n)
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