require 'spec_helper'

describe Gramercy::Grammar::Parser do

  context "questions" do

    before do
      Gramercy::PartOfSpeech::Generic.create(base_form: "what", type: "interrogative")
      Gramercy::PartOfSpeech::Generic.create(base_form: "the", type: "article")
      Gramercy::PartOfSpeech::Generic.create(base_form: "a", type: "article")
      Gramercy::PartOfSpeech::Generic.create(base_form: "an", type: "article")
    end

    context "What is your favorite movie?" do

      let(:parser) { Gramercy::Grammar::Structures::Interrogative.parser(
          text: %w{what is your favorite movie},
          verb_positions: [1],
          verbs: %w{is}
        )
      }

      it "is handled by SimpleQuestionWithInterrogative" do
        expect(parser.class.name).to eq("Gramercy::Grammar::Structures::SimpleQuestionWithInterrogative")
      end

      it "finds the predicate" do
        expect(parser.predicate).to eq("your favorite movie")
      end

    end

    context "Does the movie have a monster?" do

      let(:parser) { Gramercy::Grammar::Structures::Interrogative.parser(
          text: %w{does the movie have a monster},
          verb_positions: [1,3],
          verbs: %w{does have}
        )
      }

      it "is handled by PropertyQuestion" do
        expect(parser.class.name).to eq("Gramercy::Grammar::Structures::PropertyQuestion")
      end

      it "finds the subject" do
        expect(parser.subject).to eq("movie")
      end

      it "finds the predicate" do
        expect(parser.predicate).to eq("monster")
      end

    end

    context "Is a cat an animal?" do

      let(:parser) { Gramercy::Grammar::Structures::Interrogative.parser(
          text: %w{is a cat an animal},
          verb_positions: [0],
          verbs: %w{is}
        )
      }

      it "is handled by SimpleQuestion" do
        expect(parser.class.name).to eq("Gramercy::Grammar::Structures::SimpleQuestion")
      end

      it "finds the subject" do
        expect(parser.subject).to eq("cat")
      end

      it "finds the object" do
        expect(parser.object).to eq("animal")
      end

    end

    context "Is the movie scary?" do

      let(:parser) { Gramercy::Grammar::Structures::Interrogative.parser(
          text: %w{is the movie scary},
          verb_positions: [0],
          verbs: %w{is}
        )
      }

      it "is handled by SimpleQuestion" do
        expect(parser.class.name).to eq("Gramercy::Grammar::Structures::SimpleQuestion")
      end

      it "finds the subject" do
        expect(parser.subject).to eq("movie")
      end

      it "finds the predicate" do
        expect(parser.predicate).to eq("scary")
      end

    end

    context "What is a monster?" do

      let(:parser) { Gramercy::Grammar::Structures::Interrogative.parser(
          text: %w{what is a monster},
          verb_positions: [1],
          verbs: %w{is}
        )
      }

      it "is handled by SimpleQuestion" do
        expect(parser.class.name).to eq("Gramercy::Grammar::Structures::SimpleQuestionWithInterrogative")
      end

      it "finds the subject" do
        expect(parser.subject).to be_nil
      end

      it "finds the object" do
        expect(parser.object).to eq("monster")
      end

    end

  end

end