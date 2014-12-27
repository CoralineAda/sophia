require 'spec_helper'

describe Gramercy::Article do

  describe "::join_with_matching" do

    before do
      @a = Gramercy::Article.create(
        base_form: "a",
        pluraity: :singular
      )
    end

    it "uses 'a' for words beginning with a consonant" do
      result = Gramercy::Article.join_with_matching("a", "ruby")
      expect(result).to eq("a ruby")
    end

    it "uses 'an' for words beginning with a vowel" do
      result = Gramercy::Article.join_with_matching("a", "amethyst")
      expect(result).to eq("an amethyst")
    end

    it "uses 'a' for words beginning with the vowel sound 'you'" do
      result = Gramercy::Article.join_with_matching("a", "universe")
      expect(result).to eq("a universe")
    end

    xit "uses 'an' for words beginning with the vowel sound 'uh'" do
      result = Gramercy::Article.join_with_matching("a", "uncle")
      expect(result).to eq("an uncle")
    end

  end

end