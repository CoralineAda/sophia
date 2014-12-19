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
  contexts: ["living thing", "person", "family member"],
  synonyms: ["sis"]
)

MarkovGrammar::Noun.create(
  base_form: "brother",
  plurality: :singular,
  is_proper: false,
  gender: MarkovGrammar::Disposition::HasGender::MASCULINE,
  is_countable: true,
  contexts: ["living thing", "person", "family member"]
)

MarkovGrammar::Noun.create(
  base_form: "mother",
  plurality: :singular,
  is_proper: false,
  gender: MarkovGrammar::Disposition::HasGender::FEMININE,
  is_countable: true,
  contexts: ["living thing", "person", "family member"],
  synonyms: ["mom", "ma", "mommy"]
)

MarkovGrammar::Noun.create(
  base_form: "father",
  plurality: :singular,
  is_proper: false,
  gender: MarkovGrammar::Disposition::HasGender::MASCULINE,
  is_countable: true,
  contexts: ["living thing", "person", "family member"],
  synonyms: ["dad", "da", "daddy"]
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
  contexts: ["object", "information"],
  synonyms: ["tome", "volume"]
)

MarkovGrammar::Noun.create(
  base_form: "picture",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  contexts: ["object", "information", "representation", "sensory"],
  synonyms: ["image", "painting", "drawing", "sketch"]
)

MarkovGrammar::Noun.create(
  base_form: "conversation",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  contexts: ["information"],
  synonyms: ["talk", "chat"]
)

MarkovGrammar::Noun.create(
  base_form: "rabbit",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  contexts: ["living thing", "animal"],
  synonyms: ["hare", "bunny", "bunny rabbit"]
)

MarkovGrammar::Noun.create(
  base_form: "watch",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  contexts: ["time", "machine"],
  synonyms: ["timepiece", "pocket watch"]
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
  contexts: ["body part", "information"],
  synonyms: ["consciousness"]
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
  contexts: ["place", "nature"],
  synonyms: ["meadow"]
)

MarkovGrammar::Noun.create(
  base_form: "hole",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  contexts: ["opening", "container"],
  synonyms: ["opening", "crack", "crevasse"]
)

MarkovGrammar::Noun.create(
  base_form: "hedge",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  contexts: ["nature", "barrier", "plant", "living thing"],
  synonyms: ["hedgerow", "shrub", "bush"],
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
