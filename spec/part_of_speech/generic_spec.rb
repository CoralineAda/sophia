require 'spec_helper'

describe Gramercy::PartOfSpeech::Generic do

  describe "::base_forms" do

    before do
      Gramercy::PartOfSpeech::Generic.create(base_form: "tea")
      Gramercy::PartOfSpeech::Generic.create(base_form: "coffee")
      Gramercy::PartOfSpeech::Generic.create(base_form: "water")
    end

    it "returns base_form of all generics" do
      expected = %w{tea coffee water}
      expect(Gramercy::PartOfSpeech::Generic.base_forms).to match_array(expected)
    end

  end

  describe "::join_article_and_noun" do
    it "uses the article 'a' with a word starting with a consonant" do
      result = Gramercy::PartOfSpeech::Generic.join_article_and_noun("an", "coffee")
      expect(result).to eq("a coffee")
    end

    it "uses the article 'an' with a word starting with a vowel" do
      result = Gramercy::PartOfSpeech::Generic.join_article_and_noun("a", "aqua vitae")
      expect(result).to eq("an aqua vitae")
    end

    it "uses the article as provided" do
      result = Gramercy::PartOfSpeech::Generic.join_article_and_noun("the", "tea")
      expect(result).to eq("the tea")
    end
  end

  describe "#all_forms" do

    before do
      @verb = Gramercy::PartOfSpeech::Generic.create!(base_form: "drink", type: "verb")
      @verb.set_property("s_form", "drinks")
      @verb.set_property("ed_form", "drank")
      @verb.set_property("ing_form", "drinking")
    end

    it "returns all forms of a verb" do
      expect(@verb.all_forms).to match_array(%w{drink drinks drank drinking})
    end

  end

  describe "#set_property" do

    before do
      @word = Gramercy::PartOfSpeech::Generic.create(base_form: "beverage")
    end

    it "sets a new property" do
      @word.set_property("plural", "beverages")
      expect(@word.property("plural").value).to eq("beverages")
    end

    it "updates an existing property" do
      @word.set_property("plural", "beveri")
      expect(@word.property("plural").value).to eq("beveri")
    end
  end

  describe "#set_root" do
    before do
      @word = Gramercy::PartOfSpeech::Generic.create(base_form: "alcoholic")
      @root = Gramercy::Meta::Root.create(base_form: "alcohol")
    end

    it "sets its root" do
      @word.set_root(@root)
      expect(@word.root).to eq(@root)
    end
  end

end
