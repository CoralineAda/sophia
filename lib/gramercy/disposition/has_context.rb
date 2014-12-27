module Gramercy
  module Disposition
    module HasContext

      def self.included(klass)
        klass.send(:field, :contexts, type: Array, default: [])
        klass.extend(ClassMethods)
      end

      def contexts
        Context.as(:c).where("c.name IN #{self.contexts}").pluck('c')
      end

      module ClassMethods
      end

    end
  end
end