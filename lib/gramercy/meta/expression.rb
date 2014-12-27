module Gramercy
  module Meta
    class Expression

      include Neo4j::ActiveRel

      from_class Meta::Context
      to_class Meta::Root
      type "EXPRESSED_AS"

      property :positivity, type: Integer

      validates_presence_of :positivity

    end
  end
end