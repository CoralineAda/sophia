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
        return positive_expressions if positivity > 0
        return negative_expressions if positivity < 0
        return neutral_expressions  if positivity == 0
      end

      def positivity_of(root)
        roots(:root, :rel).pluck('rel.positivity').first
      end

      def positive_expressions
        roots(:root, :rel).where('rel.positivity > 0').pluck('DISTINCT root')
      end

      def negative_expressions
        roots(:root, :rel).where('rel.positivity < 0').pluck('DISTINCT root')
      end

      def neutral_expressions
        roots(:root, :rel).where('rel.positivity = 0').pluck('DISTINCT root')
      end

    end
  end
end