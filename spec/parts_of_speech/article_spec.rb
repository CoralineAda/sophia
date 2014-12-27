require 'spec_helper'

describe Gramercy::PartOfSpeech::Article do

  describe "::join_with_matching" do

    before do
      @a = Gramercy::PartOfSpeech::Article.create(
        base_form: "a",
        plurality: :singular
      )
    end

    it "uses 'a' for words beginning with a consonant" do
      result = Gramercy::PartOfSpeech::Article.join_with_matching("a", "ruby")
      expect(result).to eq("a ruby")
    end

    it "uses 'an' for words beginning with a vowel" do
      result = Gramercy::PartOfSpeech::Article.join_with_matching("a", "amethyst")
      expect(result).to eq("an amethyst")
    end

    it "uses 'a' for words beginning with the vowel sound 'you'" do
      result = Gramercy::PartOfSpeech::Article.join_with_matching("a", "universe")
      expect(result).to eq("a universe")
    end

    xit "uses 'an' for words beginning with the vowel sound 'uh'" do
      result = Gramercy::PartOfSpeech::Article.join_with_matching("a", "uncle")
      expect(result).to eq("an uncle")
    end

  end

end