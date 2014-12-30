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

    let(:parser) { Gramercy::Grammar::Parser.new("Where is your dog?") }

    before do
      Gramercy::PartOfSpeech::Verb.create!(base_form: "is")
      Gramercy::PartOfSpeech::Interrogative.create!(base_form: "where", type: "location")
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

    it "finds a predicate" do
      expect(parser.predicate).to eq("your dog")
    end

    it "finds nouns" do
      expect(parser.nouns).to match_array(["dog"])
    end

  end

  context "simple question" do

    let(:parser) { Gramercy::Grammar::Parser.new("Is the movie scary?") }

    before do
      Gramercy::PartOfSpeech::Verb.create(base_form: "is")
      Gramercy::PartOfSpeech::Article.create(base_form: "the")
    end

    it "finds a verb" do
      expect(parser.verb).to eq("is")
    end

    it "finds a subject" do
      expect(parser.subject).to eq("movie")
    end

    it "finds a predicate" do
      expect(parser.predicate).to eq("scary")
    end

  end

  describe "context" do

    before do

      Gramercy::PartOfSpeech::Verb.create(base_form: "is")
      Gramercy::PartOfSpeech::Interrogative.create(base_form: "why", type: "reason")

      Gramercy::Meta::Context.all.map(&:destroy)
      Gramercy::Meta::Root.all.map(&:destroy)
      Gramercy::PartOfSpeech::Verb.create(base_form: "is")

      light   = Gramercy::Meta::Root.create!(base_form: "light")
      heavy   = Gramercy::Meta::Root.create!(base_form: "heavy")
      food    = Gramercy::Meta::Root.create!(base_form: "food")
      weight  = Gramercy::Meta::Root.create!(base_form: "weight")

      @context_1 = Gramercy::Meta::Context.create!(name: "food")
      @context_1.add_expression(light, 5)
      @context_1.add_expression(food)

      @context_2 = Gramercy::Meta::Context.create!(name: "weight")
      @context_2.add_expression(light, -5)
      @context_2.add_expression(heavy, 5)
      @context_2.add_expression(weight)

    end

    it "extracts a context from a declarative sentence" do
      corpus = "This food is light."
      parser = Gramercy::Grammar::Parser.new(corpus)
      expect(parser.context).to eq(@context_1)
    end

    it "extracts a context from an interrogative sentence" do
      corpus = "Why is this so heavy?"
      parser = Gramercy::Grammar::Parser.new(corpus)
      expect(parser.context).to eq(@context_2)
    end

  end

end