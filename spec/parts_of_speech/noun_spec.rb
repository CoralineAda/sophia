require 'spec_helper'

describe MarkovGrammar::Noun do

  describe "::construct" do
    it "returns a new proper noun" do
      expect(MarkovGrammar::Noun.construct("Alice").is_proper).to be_truthy
    end

    it "returns a new common noun" do
      expect(MarkovGrammar::Noun.construct("animal").is_proper).to be_falsey
    end
  end

  describe "::from" do
    before do
      @locust = MarkovGrammar::Noun.create(base_form: 'locust')
    end

    it "finds a word by stem" do
      expect(MarkovGrammar::Noun.from("locusts")).to eq @locust
    end

    it "returns a new noun if no match is found" do
      expect(MarkovGrammar::Noun.from("vocals").base_form).to eq "vocals"
    end
  end

  describe ".base_form_or_synonym" do
    let(:noun) { MarkovGrammar::Noun.new(
        base_form: "plague",
        synonyms: ["disease", "malady", "outbreak"]
      )
    }

    it "returns the base form unless synonyms are enabled" do
      noun.enable_synonyms = false
      count = (0..99).map do |i|
        noun.base_form_or_synonym == "plague" || nil
      end.compact.count
      expect(count).to eq 100
    end

    it "returns synonyms or base form if synonyms are enabled" do
      noun.enable_synonyms = true
      count = (0..99).map do |i|
        noun.base_form_or_synonym == "malady" || nil
      end.compact.count
      expect(count).to be_within(20).of(25)
    end
  end

  describe ".plural" do
    let(:milk) { MarkovGrammar::Noun.new(
        base_form: "milk",
        is_countable: false
      )
    }
    let(:tricycle) { MarkovGrammar::Noun.new(
        base_form: "tricycle",
        is_countable: true
      )
    }

    it "pluralizes a countable noun" do
      expect(tricycle.plural).to eq("tricycles")
    end

    it "does not pluralize a non-countable noun" do
      expect(milk.plural).to eq("milk")
    end
  end

  describe ".possessive_singular" do
    let(:glasses) { MarkovGrammar::Noun.new(base_form: 'glasses') }
    let(:djinn)   { MarkovGrammar::Noun.new(base_form: 'djinn') }

    it "returns the correct possessive for a word ending in s" do
      expect(glasses.possessive_singular).to eq("glasses'")
    end

    it "returns the correct possessive for a word not ending in s" do
      expect(djinn.possessive_singular).to eq("djinn's")
    end
  end

  describe ".possessive_plural" do
    let(:general) { MarkovGrammar::Noun.new(base_form: 'general') }
    let(:cactus)  { MarkovGrammar::Noun.new(base_form: 'cactus', plural_form: 'cacti') }

    it "returns the correct possessive for a word ending in s" do
      expect(general.possessive_plural).to eq("generals'")
    end

    it "returns the correct possessive for a word not ending in s" do
      expect(cactus.possessive_plural).to eq("cacti's")
    end
  end

end