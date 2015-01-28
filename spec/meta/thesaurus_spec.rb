require 'spec_helper'

describe Gramercy::Meta::Thesaurus do

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

  let(:thesaurus) { Gramercy::Meta::Thesaurus.new(context: @disposition, root: @scroogey)}

  describe "#antonyms_in_context" do
    it "returns antonyms" do
      expect(thesaurus.antonyms).to match_array([@charitable])
    end
  end

  describe "#synonyms_in_context" do
    it "returns synonyms" do
      expect(thesaurus.synonyms).to match_array([@selfish])
    end
  end

  describe "related_in_context" do
    it "returns related terms" do
      expect(thesaurus.related_roots).to match_array([@neutral])
    end
  end

end
