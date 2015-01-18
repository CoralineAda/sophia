require 'spec_helper'

describe Gramercy::Meta::Root do


  describe "::all_with_context_names" do

    before do
      @disposition = Gramercy::Meta::Context.find_or_create_by(name: "disposition")
      @charity = Gramercy::Meta::Context.find_or_create_by(name: "charity")

      @scroogey = Gramercy::Meta::Root.find_or_create_by(base_form: "scrooge")
      @nice = Gramercy::Meta::Root.find_or_create_by(base_form: "nice")

      @disposition.add_expression(@scroogey, -5)
      @disposition.add_expression(@nice, 5)

      @charity.add_expression(@scroogey, -5)
    end

    it "returns all roots and associated contexts" do
      result = Gramercy::Meta::Root.all_with_context_names
      expected = [["nice", "disposition"], ["scrooge", "disposition"], ["scrooge", "charity"]]
      expect(result).to match_array(expected)
    end

  end

  describe "#positivity_in_context" do

    before do
      @disposition = Gramercy::Meta::Context.find_or_create_by(name: "disposition")
      @scroogey = Gramercy::Meta::Root.find_or_create_by(base_form: "scrooge")
      @disposition.add_expression(@scroogey, -5)
    end

    it "returns the positivity of a root to a given context" do
      expect(@scroogey.positivity_in_context(@disposition)).to eq(-5)
    end

  end

  context "synonyms and antonyms" do

    before do
      @disposition = Gramercy::Meta::Context.find_or_create_by(name: "disposition")
      @scroogey = Gramercy::Meta::Root.find_or_create_by(base_form: "scrooge")
      @selfish = Gramercy::Meta::Root.find_or_create_by(base_form: "selfish")
      @charitable = Gramercy::Meta::Root.find_or_create_by(base_form: "charitable")
      @neutral = Gramercy::Meta::Root.find_or_create_by(base_form: "neutral")

      @disposition.add_expression(@scroogey, -5)
      @disposition.add_expression(@selfish, -3)
      @disposition.add_expression(@charitable, 7)
      @disposition.add_expression(@neutral, 0)

    end

    describe "#antonyms_in_context" do
      it "returns antonyms" do
        expect(@scroogey.antonyms_in_context(@disposition)).to match_array([@charitable])
      end
    end

    describe "#synonyms_in_context" do
      it "returns synonyms" do
        expect(@scroogey.synonyms_in_context(@disposition)).to match_array([@selfish])
      end
    end

    describe "related_in_context" do
      it "returns related terms" do
        expect(@scroogey.related_in_context(@disposition)).to match_array([@neutral])
      end
    end
  end
end