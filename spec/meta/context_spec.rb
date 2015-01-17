require 'spec_helper'

describe Gramercy::Meta::Context do

  describe "::from" do

    before :all do

      @gaiman = Gramercy::Meta::Context.create!(name: "gaiman")
      @mckean = Gramercy::Meta::Context.create!(name: "mckean")
      @lovecraft = Gramercy::Meta::Context.create!(name: "lovecraft")

      @term_1 = Gramercy::Meta::Root.create!(base_form: "sandman")
      @term_2 = Gramercy::Meta::Root.create!(base_form: "coraline")
      @term_3 = Gramercy::Meta::Root.create!(base_form: "mirrormask")
      @term_4 = Gramercy::Meta::Root.create!(base_form: "call of cthulhu")

      @gaiman.add_expression(@term_1)
      @mckean.add_expression(@term_2)
      @mckean.add_expression(@term_1)
      @mckean.add_expression(@term_2)
      @mckean.add_expression(@term_3)
      @lovecraft.add_expression(@term_4)

    end

    it "finds a context associated with a word" do
      result = Gramercy::Meta::Context.from(['call of cthulhu'])
      expect(result).to match_array([@lovecraft])
    end

    it "finds a contexts associated with a set of words" do
      result = Gramercy::Meta::Context.from(['sandman', 'mirrormask'])
      expect(result).to eq([@mckean, @gaiman])
    end

  end

  describe "#add_expression" do
    it "creates an expression edge"
    it "sets the positivity of the edge"
  end

  context "positivity" do

    describe "#words_with_positivity" do
      it "returns positive expressions"
      it "returns negative expressions"
      it "returns neutral expressions"
    end

    describe "#positive_expressions" do
      it "finds positive expressions of a context"
    end

    describe "#negative_expressions" do
      it "finds negative expressions of a context"
    end

    describe "#neutral_expressions" do
      it "finds neutral expressions of a context"
    end
  end

end