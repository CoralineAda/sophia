require 'spec_helper'

describe MarkovGrammar::Verb do

  describe ".inject_adverb" do

    let(:verb)   { MarkovGrammar::Verb.new(base_form: 'run', ing_form: 'running') }

    it "inserts an adverb before a simple verb" do
      verb.plurality = :singular
      verb.person = :third
      verb.tense = :present
      expect(verb.inject_adverb("quickly")).to eq("quickly runs")
    end

    it "inserts an adverb between compound verbs" do
      verb.plurality = :singular
      verb.person = :third
      verb.tense = :present_participle
      expect(verb.inject_adverb("quickly")).to eq("is quickly running")
    end

  end

end