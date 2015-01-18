require 'spec_helper'

describe Gramercy::Grammar::Parser do

  context "questions" do

    context "Elpheba is my cat." do

      let(:parser) { Gramercy::Grammar::Structures::Declarative.parser(
          text: %w{elpheba is my cat},
          verb_positions: [1],
          verbs: %w{is}
        )
      }

      it "is handled by SimpleDeclarative" do
        expect(parser.class.name).to eq("Gramercy::Grammar::Structures::SimpleDeclarative")
      end

      it "finds the subject" do
        expect(parser.subject).to eq("elpheba")
      end

      it "finds the predicate" do
        expect(parser.predicate).to eq("my cat")
      end

    end

  end

end