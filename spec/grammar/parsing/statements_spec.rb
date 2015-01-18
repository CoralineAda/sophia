require 'spec_helper'

describe Gramercy::Grammar::Parser do

  context "statements" do

    before do
      Gramercy::PartOfSpeech::Generic.create(base_form: "a", type: "article")
      Gramercy::PartOfSpeech::Generic.create(base_form: "small", type: "adjective")
      Gramercy::PartOfSpeech::Generic.create(base_form: "grey", type: "adjective")
      Gramercy::PartOfSpeech::Generic.create(base_form: "cute", type: "adjective")
      Gramercy::PartOfSpeech::Generic.create(base_form: "big", type: "adjective")
      Gramercy::PartOfSpeech::Generic.create(base_form: "black", type: "adjective")
    end

    context "A raven is a big black bird." do

      let(:parser) { Gramercy::Grammar::Structures::Declarative.parser(
          text: %w{a raven is a big black bird},
          verb_positions: [2],
          verbs: %w{is}
        )
      }

      it "is handled by SimpleDeclarative" do
        expect(parser.class.name).to eq("Gramercy::Grammar::Structures::SimpleDeclarative")
      end

      it "finds the subject" do
        expect(parser.subject).to eq("raven")
      end

      it "finds the predicate" do
        expect(parser.predicate).to eq("a big black bird")
      end

      it "finds descriptors" do
        expect(parser.descriptors).to match_array(%w{big black})
      end

    end

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

    context "She is a small, grey cat." do

      let(:parser) { Gramercy::Grammar::Structures::Declarative.parser(
          text: %w{she is a small grey cat},
          verb_positions: [1],
          verbs: %w{is}
        )
      }

      it "finds the subject" do
        expect(parser.subject).to eq("she")
      end

      it "finds the predicate" do
        expect(parser.predicate).to eq("a small grey cat")
      end

      it "finds the object" do
        expect(parser.object).to eq("cat")
      end

      it "finds descriptors" do
        expect(parser.descriptors).to eq(%w{small grey})
      end

    end

    context "She is cute." do

      let(:parser) { Gramercy::Grammar::Structures::Declarative.parser(
          text: %w{she is cute},
          verb_positions: [1],
          verbs: %w{is}
        )
      }

      it "finds the subject" do
        expect(parser.subject).to eq("she")
      end

      it "finds the predicate" do
        expect(parser.predicate).to eq("cute")
      end

      it "does not find an object" do
        expect(parser.object).to be_nil
      end

      it "finds descriptors" do
        expect(parser.descriptors).to eq(%w{cute})
      end

    end

  end

end