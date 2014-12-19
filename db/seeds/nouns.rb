require './markov_grammar'

MarkovGrammar::Noun.create(
  base_form: "Alice",
  plurality: :singular,
  is_proper: true,
  gender: MarkovGrammar::Disposition::HasGender::FEMININE,
  is_countable: false,
  contexts: ["living thing", "person"]
)

MarkovGrammar::Noun.create(
  base_form: "sister",
  plurality: :singular,
  is_proper: false,
  gender: MarkovGrammar::Disposition::HasGender::FEMININE,
  is_countable: true,
  contexts: ["living thing", "person", "family member"]
)

MarkovGrammar::Noun.create(
  base_form: "bank",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  contexts: ["place"]
)

MarkovGrammar::Noun.create(
  base_form: "book",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  contexts: ["object", "information",]
)

MarkovGrammar::Noun.create(
  base_form: "picture",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  contexts: ["object", "information", "representation", "sensory"]
)

MarkovGrammar::Noun.create(
  base_form: "conversation",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  contexts: ["information"]
)

MarkovGrammar::Noun.create(
  base_form: "rabbit",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  contexts: ["living thing", "animal"]
)

MarkovGrammar::Noun.create(
  base_form: "watch",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  contexts: ["time", "machine"]
)

MarkovGrammar::Noun.create(
  base_form: "pocket",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  contexts: ["clothing", "container"]
)

MarkovGrammar::Noun.create(
  base_form: "foot",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  contexts: ["body part", "locomotion"]
)

MarkovGrammar::Noun.create(
  base_form: "mind",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  contexts: ["body part", "information"]
)

MarkovGrammar::Noun.create(
  base_form: "curiosity",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  contexts: ["information"]
)

MarkovGrammar::Noun.create(
  base_form: "field",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  contexts: ["place", "nature"]
)

MarkovGrammar::Noun.create(
  base_form: "hole",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  contexts: ["opening", "container"]
)

MarkovGrammar::Noun.create(
  base_form: "hedge",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  contexts: ["nature", "barrier", "plant", "living thing"]
)

MarkovGrammar::Noun.create(
  base_form: "time",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  contexts: ["time", "duration"]
)

MarkovGrammar::Noun.create(
  base_form: "year",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  contexts: ["time", "duration"]
)

MarkovGrammar::Noun.create(
  base_form: "person",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  contexts: ["living thing", "person"]
)
