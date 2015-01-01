Gramercy::PartOfSpeech::Noun.create(
  base_form: "Alice",
  plurality: :singular,
  is_proper: true,
  gender: Gramercy::Disposition::HasGender::FEMININE,
  is_countable: false,
  is_physical: true,
  context_names: ["living thing", "person"]
)

Gramercy::PartOfSpeech::Noun.create(
  base_form: "sister",
  plurality: :singular,
  is_proper: false,
  gender: Gramercy::Disposition::HasGender::FEMININE,
  is_countable: true,
  is_physical: true,
  context_names: ["living thing", "person", "family member"],
  synonyms: ["sis"]
)

Gramercy::PartOfSpeech::Noun.create(
  base_form: "brother",
  plurality: :singular,
  is_proper: false,
  gender: Gramercy::Disposition::HasGender::MASCULINE,
  is_countable: true,
  is_physical: true,
  context_names: ["living thing", "person", "family member"]
)

Gramercy::PartOfSpeech::Noun.create(
  base_form: "mother",
  plurality: :singular,
  is_proper: false,
  gender: Gramercy::Disposition::HasGender::FEMININE,
  is_countable: true,
  is_physical: true,
  context_names: ["living thing", "person", "family member"],
  synonyms: ["mom", "ma", "mommy"]
)

Gramercy::PartOfSpeech::Noun.create(
  base_form: "father",
  plurality: :singular,
  is_proper: false,
  gender: Gramercy::Disposition::HasGender::MASCULINE,
  is_countable: true,
  is_physical: true,
  context_names: ["living thing", "person", "family member"],
  synonyms: ["dad", "da", "daddy"]
)

Gramercy::PartOfSpeech::Noun.create(
  base_form: "bank",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  is_physical: true,
  context_names: ["place"]
)

Gramercy::PartOfSpeech::Noun.create(
  base_form: "book",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  is_physical: true,
  context_names: ["object", "information"],
  synonyms: ["tome", "volume"]
)

Gramercy::PartOfSpeech::Noun.create(
  base_form: "picture",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  is_physical: true,
  context_names: ["object", "information", "representation", "sensory"],
  synonyms: ["image", "painting", "drawing", "sketch"]
)

Gramercy::PartOfSpeech::Noun.create(
  base_form: "conversation",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  is_physical: false,
  context_names: ["information"],
  synonyms: ["talk", "chat"]
)

Gramercy::PartOfSpeech::Noun.create(
  base_form: "rabbit",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  is_physical: true,
  context_names: ["living thing", "animal"],
  synonyms: ["hare", "bunny", "bunny rabbit"]
)

Gramercy::PartOfSpeech::Noun.create(
  base_form: "watch",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  is_physical: true,
  context_names: ["time", "machine"],
  synonyms: ["timepiece", "pocket watch"]
)

Gramercy::PartOfSpeech::Noun.create(
  base_form: "pocket",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  is_physical: true,
  context_names: ["clothing", "container"]
)

Gramercy::PartOfSpeech::Noun.create(
  base_form: "foot",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  is_physical: true,
  context_names: ["body part", "locomotion"]
)

Gramercy::PartOfSpeech::Noun.create(
  base_form: "mind",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  is_physical: false,
  context_names: ["body part", "information"],
  synonyms: ["consciousness"]
)

Gramercy::PartOfSpeech::Noun.create(
  base_form: "curiosity",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  is_physical: false,
  context_names: ["information"]
)

Gramercy::PartOfSpeech::Noun.create(
  base_form: "field",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  is_physical: true,
  context_names: ["place", "nature"],
  synonyms: ["meadow"]
)

Gramercy::PartOfSpeech::Noun.create(
  base_form: "hole",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  is_physical: true,
  context_names: ["opening", "container"],
  synonyms: ["opening", "crack", "crevasse"]
)

Gramercy::PartOfSpeech::Noun.create(
  base_form: "hedge",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  is_physical: true,
  context_names: ["nature", "barrier", "plant", "living thing"],
  synonyms: ["hedgerow", "shrub", "bush"],
)

Gramercy::PartOfSpeech::Noun.create(
  base_form: "time",
  plurality: :singular,
  is_proper: false,
  is_physical: false,
  is_countable: true,
  context_names: ["time", "duration"]
)

Gramercy::PartOfSpeech::Noun.create(
  base_form: "year",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  is_physical: false,
  context_names: ["time", "duration"]
)

Gramercy::PartOfSpeech::Noun.create(
  base_form: "person",
  plurality: :singular,
  is_proper: false,
  is_countable: true,
  is_physical: true,
  context_names: ["living thing", "person"]
)
