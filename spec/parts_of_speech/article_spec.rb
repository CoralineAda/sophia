require 'spec_helper'

describe MarkovGrammar::Article do

  describe "::join_with_matching" do

    before do
      @a = MarkovGrammar::Article.create(
        base_form: "a",
        pluraity: :singular
      )
    end

    it "uses 'a' for words beginning with a consonant" do
      result = MarkovGrammar::Article.join_with_matching("a", "ruby")
      expect(result).to eq("a ruby")
    end

    it "uses 'an' for words beginning with a vowel" do
      result = MarkovGrammar::Article.join_with_matching("a", "amethyst")
      expect(result).to eq("an amethyst")
    end

    it "uses 'a' for words beginning with the vowel sound 'you'" do
      result = MarkovGrammar::Article.join_with_matching("a", "universe")
      expect(result).to eq("a universe")
    end

    xit "uses 'an' for words beginning with the vowel sound 'uh'" do
      result = MarkovGrammar::Article.join_with_matching("a", "uncle")
      expect(result).to eq("an uncle")
    end

  end

end