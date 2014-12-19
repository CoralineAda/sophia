require './markov_grammar'

MarkovGrammar::Pronoun.create(
  base_form: "I",
  plurality: :singular,
  person: :first,
  is_subjective: true
)

MarkovGrammar::Pronoun.create(
  base_form: "you",
  plurality: :singular,
  person: :second,
  is_subjective: true
)

MarkovGrammar::Pronoun.create(
  base_form: "he",
  plurality: :singular,
  gender: MarkovGrammar::Disposition::HasGender::MASCULINE,
  person: :third,
  is_subjective: true
)

MarkovGrammar::Pronoun.create(
  base_form: "she",
  plurality: :singular,
  person: :third,
  gender: MarkovGrammar::Disposition::HasGender::FEMININE,
  is_subjective: true
)

MarkovGrammar::Pronoun.create(
  base_form: "it",
  plurality: :singular,
  gender: MarkovGrammar::Disposition::HasGender::NONE,
  person: :third,
  is_subjective: true
)

MarkovGrammar::Pronoun.create(
  base_form: "they",
  plurality: :singular,
  gender: MarkovGrammar::Disposition::HasGender::NEUTRAL,
  person: :third,
  is_subjective: true
)

MarkovGrammar::Pronoun.create(
  base_form: "we",
  plurality: :singular,
  person: :first,
  is_subjective: true
)

MarkovGrammar::Pronoun.create(
  base_form: "you",
  plurality: :plural,
  person: :second,
  is_subjective: true
)

MarkovGrammar::Pronoun.create(
  base_form: "they",
  plurality: :plural,
  person: :third,
  is_subjective: true
)

MarkovGrammar::Pronoun.create(
  base_form: "me",
  plurality: :singular,
  person: :first,
  is_objective: true
)

MarkovGrammar::Pronoun.create(
  base_form: "you",
  plurality: :singular,
  person: :second,
  is_objective: true
)

MarkovGrammar::Pronoun.create(
  base_form: "him",
  plurality: :singular,
  gender: MarkovGrammar::Disposition::HasGender::MASCULINE,
  person: :third,
  is_objective: true
)

MarkovGrammar::Pronoun.create(
  base_form: "her",
  plurality: :singular,
  gender: MarkovGrammar::Disposition::HasGender::FEMININE,
  person: :third,
  is_objective: true
)

MarkovGrammar::Pronoun.create(
  base_form: "them",
  plurality: :singular,
  gender: MarkovGrammar::Disposition::HasGender::NEUTRAL,
  person: :third,
  is_objective: true
)

MarkovGrammar::Pronoun.create(
  base_form: "it",
  plurality: :singular,
  gender: MarkovGrammar::Disposition::HasGender::NONE,
  person: :third,
  is_objective: true
)

MarkovGrammar::Pronoun.create(
  base_form: "we",
  plurality: :plural,
  person: :first,
  is_objective: true
)

MarkovGrammar::Pronoun.create(
  base_form: "you",
  plurality: :plural,
  person: :second,
  is_objective: true
)

MarkovGrammar::Pronoun.create(
  base_form: "them",
  plurality: :plural,
  gender: 0,
  person: :third,
  is_objective: true
)

MarkovGrammar::Pronoun.create(
  base_form: "mine",
  plurality: :singular,
  person: :first,
  is_possessive: true
)

MarkovGrammar::Pronoun.create(
  base_form: "yours",
  plurality: :singular,
  person: :second,
  is_possessive: true
)

MarkovGrammar::Pronoun.create(
  base_form: "his",
  plurality: :singular,
  person: :third,
  gender: MarkovGrammar::Disposition::HasGender::MASCULINE,
  is_possessive: true
)

MarkovGrammar::Pronoun.create(
  base_form: "hers",
  plurality: :singular,
  person: :third,
  gender: MarkovGrammar::Disposition::HasGender::FEMININE,
  is_possessive: true
)

MarkovGrammar::Pronoun.create(
  base_form: "theirs",
  plurality: :singular,
  person: :third,
  gender: MarkovGrammar::Disposition::HasGender::NEUTRAL,
  is_possessive: true
)

MarkovGrammar::Pronoun.create(
  base_form: "ours",
  plurality: :plural,
  person: :first,
  is_possessive: true
)

MarkovGrammar::Pronoun.create(
  base_form: "yours",
  plurality: :plural,
  person: :second,
  is_possessive: true
)

MarkovGrammar::Pronoun.create(
  base_form: "theirs",
  plurality: :plural,
  person: :third,
  is_possessive: true
)

