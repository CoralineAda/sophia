require 'spec_helper'

describe Gramercy::Grammar::Parser do

  context "declarative sentence" do

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

    it "finds a predicate" do
      expect(parser.predicate).to eq("a dog")
    end

    it "finds nouns" do
      expect(parser.nouns).to match_array(["dog", "animal"])
    end

  end

  context "interrogative sentence" do

    let(:corpus)  { "Where is your dog?"}
    let(:parser)  { Gramercy::Grammar::Parser.new(corpus) }

    before do
      Gramercy::PartOfSpeech::Verb.create(base_form: "is")
    end

    it "finds an interrogative" do
      expect(parser.interrogative).to eq("where")
    end

    it "finds a verb" do
      expect(parser.verb).to eq("is")
    end

    it "does not find a subject" do
      expect(parser.subject).to be_nil
    end

    it "finds an object" do
      expect(parser.predicate).to eq("your dog")
    end

    it "finds nouns" do
      expect(parser.nouns).to match_array(["dog"])
    end

  end

  describe "context" do

    let(:corpus)  { "My favorite animal is a dog."}
    let(:parser)  { Gramercy::Grammar::Parser.new(corpus) }

    before do

      Gramercy::Meta::Context.all.map(&:destroy)
      Gramercy::Meta::Root.all.map(&:destroy)
      Gramercy::PartOfSpeech::Verb.create(base_form: "is")

      dog = Gramercy::Meta::Root.create!(base_form: "dog")
      animal = Gramercy::Meta::Root.create!(base_form: "animal")

      @context_1 = Gramercy::Meta::Context.create!(name: "animal")
      @context_1.add_expression(dog, 0)
      @context_1.add_expression(animal, 0)

      @context_2 = Gramercy::Meta::Context.create!(name: "beauty")
      @context_2.add_expression(dog, -5)

    end

    it "extracts a context from a declarative sentence" do
      expect(parser.context).to eq(@context_1)
    end

  end

end