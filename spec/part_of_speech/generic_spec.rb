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

  it "tests instance methods"

end