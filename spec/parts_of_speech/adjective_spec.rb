require 'spec_helper'

describe MarkovGrammar::Adjective do

  describe "::pair_with_noun" do

    before do
      @variety = MarkovGrammar::Noun.new(
        base_form: 'variety',
        is_physical: false
      )
      @pretty = MarkovGrammar::Adjective.create(
        base_form: 'pretty',
        is_physical: true,
        gender: MarkovGrammar::Disposition::HasGender::FEMININE
      )
      @surprising = MarkovGrammar::Adjective.create(
        base_form: 'surprising',
        is_physical: false,
        gender: MarkovGrammar::Disposition::HasGender::NONE
      )
    end

    it "returns an adjective matching a noun" do
      result = MarkovGrammar::Adjective.pair_with_noun(@variety, @variety.base_form, [:is_physical])
      expect(result).to eq "surprising variety"
    end

  end

end