require 'spec_helper'

describe MarkovGrammar::Article do

  describe "::join_with_matching" do

    before do
      @a = MarkovGrammar::Article.create(
        base_form: "a",
        pluraity: :singular
      )
      @some = MarkovGrammar::Article.create(
        base_form: "some",
        pluraity: :plural
      )
      @plethora = MarkovGrammar::Noun.new(
        base_form: "plethora"
      )
    end

    it "uses 'a' for words beginning with a consonant" do
    end

    it "uses 'an' for words beginning with a vowel" do
    end

    it "uses 'a' for words beginning with the vowel 'u'" do
    end

  end

end