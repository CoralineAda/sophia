require 'spec_helper'

describe Gramercy::PartOfSpeech::Adjective do

  describe "::pair_with_noun" do

    before do
      @variety = Gramercy::Disposition.new(
        base_form: 'variety',
        is_physical: false
      )
      @pretty = Gramercy::PartOfSpeech::Adjective.create(
        base_form: 'pretty',
        is_physical: true,
        gender: Gramercy::Disposition::HasGender::FEMININE
      )
      @surprising = Gramercy::PartOfSpeech::Adjective.create(
        base_form: 'surprising',
        is_physical: false,
        gender: Gramercy::Disposition::HasGender::NONE
      )
    end

    it "returns an adjective matching a noun" do
      result = Gramercy::PartOfSpeech::Adjective.pair_with_noun(@variety, @variety.base_form, [:is_physical])
      expect(result).to eq "surprising variety"
    end

  end

end