require 'spec_helper'

describe Gramercy::Adjective do

  describe "::pair_with_noun" do

    before do
      @variety = Gramercy::Noun.new(
        base_form: 'variety',
        is_physical: false
      )
      @pretty = Gramercy::Adjective.create(
        base_form: 'pretty',
        is_physical: true,
        gender: Gramercy::Disposition::HasGender::FEMININE
      )
      @surprising = Gramercy::Adjective.create(
        base_form: 'surprising',
        is_physical: false,
        gender: Gramercy::Disposition::HasGender::NONE
      )
    end

    it "returns an adjective matching a noun" do
      result = Gramercy::Adjective.pair_with_noun(@variety, @variety.base_form, [:is_physical])
      expect(result).to eq "surprising variety"
    end

  end

end