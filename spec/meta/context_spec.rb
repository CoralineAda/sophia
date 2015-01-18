require 'spec_helper'

describe Gramercy::Meta::Context do

  describe "::from" do

    before do

      @gaiman = Gramercy::Meta::Context.find_or_create_by(name: "gaiman")
      @mckean = Gramercy::Meta::Context.find_or_create_by(name: "mckean")
      @lovecraft = Gramercy::Meta::Context.find_or_create_by(name: "lovecraft")

      @sandman = Gramercy::Meta::Root.find_or_create_by(base_form: "sandman")
      @coraline = Gramercy::Meta::Root.find_or_create_by(base_form: "coraline")
      @mirrormask = Gramercy::Meta::Root.find_or_create_by(base_form: "mirrormask")
      @cthulhu = Gramercy::Meta::Root.find_or_create_by(base_form: "call of cthulhu")

      @gaiman.add_expression(@sandman)
      @mckean.add_expression(@coraline)
      @mckean.add_expression(@sandman)
      @mckean.add_expression(@coraline)
      @mckean.add_expression(@mirrormask)
      @lovecraft.add_expression(@cthulhu)

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

    before do
      @gaiman = Gramercy::Meta::Context.find_or_create_by(name: "gaiman")
      @death = Gramercy::Meta::Root.find_or_create_by(base_form: "death becomes her")
      @gaiman.add_expression(@death)
    end

    it "creates an expression edge" do
      expect(@gaiman.roots.to_a).to include(@death)
    end

  end

  describe "#positivity_of" do

    before do
      @blackwood = Gramercy::Meta::Context.find_or_create_by(name: "blackwood")
      @trees = Gramercy::Meta::Root.find_or_create_by(base_form: "the man whom the trees loved")
      @blackwood.add_expression(@trees, 5)
    end

    it "gets the positivity of the edge" do
      expect(@blackwood.positivity_of(@trees)).to eq(5)
    end

  end

  context "positivity" do

    before do
      @artwork = Gramercy::Meta::Context.find_or_create_by(name: "artwork")
      @sandman = Gramercy::Meta::Root.find_or_create_by(base_form: "sandman")
      @constantine = Gramercy::Meta::Root.find_or_create_by(base_form: "constantine")
      @batgirl = Gramercy::Meta::Root.find_or_create_by(base_form: "batgirl")

      @artwork.add_expression(@sandman, 5)
      @artwork.add_expression(@constantine, 0)
      @artwork.add_expression(@batgirl, -5)
    end

    describe "#positive_expressions" do
      it "finds positive expressions of a context" do
        expect(@artwork.positive_expressions).to eq([@sandman])
      end
    end

    describe "#negative_expressions" do
      it "finds negative expressions of a context" do
        expect(@artwork.negative_expressions).to eq([@batgirl])
      end
    end

    describe "#neutral_expressions" do
      it "finds neutral expressions of a context" do
        expect(@artwork.neutral_expressions).to eq([@constantine])
      end
    end
  end

end