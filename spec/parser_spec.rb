require 'spec_helper'

describe Gramercy::Grammar::Parser do

  context "simple corpus" do

    let(:corpus)  { "My favorite animal is a dog."}

    let(:context_1) { Gramercy::Meta::Context.create(name: 'animal') }
    let(:context_2) { Gramercy::Meta::Context.create(name: 'beauty') }

    let(:parser)  { Gramercy::Grammar::Parser.new(corpus) }

    before do
      context_1.words = [
        Gramercy::Meta::Word.create(base_form: "animal"),
        Gramercy::Meta::Word.create(base_form: "dog"),
        Gramercy::Meta::Word.create(base_form: "cat"),
        Gramercy::Meta::Word.create(base_form: "bird")
      ]

      context_2.words = [
        Gramercy::Meta::Word.create(base_form: "beauty"),
        Gramercy::Meta::Word.create(base_form: "pretty"),
        Gramercy::Meta::Word.create(base_form: "model"),
        Gramercy::Meta::Word.create(base_form: "dog")
      ]

    end

    it "finds nouns" do
      expect(parser.nouns).to match_array(["dog", "animal"])
    end

    xit "identifies a context" do
      expect(parser.contexts.first).to eq("animal")
    end

  end

end