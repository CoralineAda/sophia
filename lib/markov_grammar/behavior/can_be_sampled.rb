module MarkovGrammar
  module Behavior
    module CanBeSampled

      def self.included(klass)
        klass.send(:field, :last_sampled_at, type: DateTime)
        klass.extend ClassMethods
      end

      module ClassMethods
        def sample
          sample = asc(:last_sampled_at).limit(all.count - 1).to_a.sample
          sample && sample.update_attribute(:last_sampled_at, DateTime.now)
          sample
        end
      end

    end

  end
end