Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "I",
  plurality: :singular,
  person: :first,
  is_subjective: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "you",
  plurality: :singular,
  person: :second,
  is_subjective: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "he",
  plurality: :singular,
  gender: Gramercy::PartOfSpeech::Disposition::HasGender::MASCULINE,
  person: :third,
  is_subjective: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "she",
  plurality: :singular,
  person: :third,
  gender: Gramercy::PartOfSpeech::Disposition::HasGender::FEMININE,
  is_subjective: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "it",
  plurality: :singular,
  gender: Gramercy::PartOfSpeech::Disposition::HasGender::NONE,
  person: :third,
  is_subjective: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "they",
  plurality: :singular,
  gender: Gramercy::PartOfSpeech::Disposition::HasGender::NEUTRAL,
  person: :third,
  is_subjective: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "we",
  plurality: :singular,
  person: :first,
  is_subjective: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "you",
  plurality: :plural,
  person: :second,
  is_subjective: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "they",
  plurality: :plural,
  person: :third,
  is_subjective: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "me",
  plurality: :singular,
  person: :first,
  is_objective: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "you",
  plurality: :singular,
  person: :second,
  is_objective: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "him",
  plurality: :singular,
  gender: Gramercy::PartOfSpeech::Disposition::HasGender::MASCULINE,
  person: :third,
  is_objective: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "her",
  plurality: :singular,
  gender: Gramercy::PartOfSpeech::Disposition::HasGender::FEMININE,
  person: :third,
  is_objective: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "them",
  plurality: :singular,
  gender: Gramercy::PartOfSpeech::Disposition::HasGender::NEUTRAL,
  person: :third,
  is_objective: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "it",
  plurality: :singular,
  gender: Gramercy::PartOfSpeech::Disposition::HasGender::NONE,
  person: :third,
  is_objective: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "we",
  plurality: :plural,
  person: :first,
  is_objective: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "you",
  plurality: :plural,
  person: :second,
  is_objective: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "them",
  plurality: :plural,
  gender: 0,
  person: :third,
  is_objective: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "mine",
  plurality: :singular,
  person: :first,
  is_possessive: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "yours",
  plurality: :singular,
  person: :second,
  is_possessive: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "his",
  plurality: :singular,
  person: :third,
  gender: Gramercy::PartOfSpeech::Disposition::HasGender::MASCULINE,
  is_possessive: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "hers",
  plurality: :singular,
  person: :third,
  gender: Gramercy::PartOfSpeech::Disposition::HasGender::FEMININE,
  is_possessive: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "theirs",
  plurality: :singular,
  person: :third,
  gender: Gramercy::PartOfSpeech::Disposition::HasGender::NEUTRAL,
  is_possessive: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "ours",
  plurality: :plural,
  person: :first,
  is_possessive: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "yours",
  plurality: :plural,
  person: :second,
  is_possessive: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "theirs",
  plurality: :plural,
  person: :third,
  is_possessive: true
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "everyone",
  plurality: :plural, #FIXME sure?
  person: :third
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "noone",
  plurality: :singular,
  person: :third
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "none",
  plurality: :plural,
  person: :third
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "either",
  plurality: :singular,
  person: :third
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "neither",
  plurality: :singular,
  person: :third
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "this",
  plurality: :singular,
  person: :third
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "those",
  plurality: :plural,
  person: :third
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "these",
  plurality: :plural,
  person: :third
)

Gramercy::PartOfSpeech::Pronoun.create(
  base_form: "that",
  plurality: :singular,
  person: :third
)
