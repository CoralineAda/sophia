require 'spec_helper'

describe Gramercy::Grammar::Parser do

  context "simple corpus" do

    let(:corpus)  { "My favorite animal is a dog."}
    let(:parser)  { Gramercy::Grammar::Parser.new(corpus) }

    before do
      Gramercy::PartOfSpeech::Verb.create(base_form: "is")
    end

    it "finds a verb" do
      expect(parser.verb).to eq("is")
    end

    it "finds a subject" do
      expect(parser.subject).to eq("my favorite animal")
    end

    it "finds an object" do
      expect(parser.predicate).to eq("a dog")
    end

    it "finds nouns" do
      expect(parser.nouns).to match_array(["dog", "animal"])
    end

  end

end