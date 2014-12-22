require './markov_grammar'

MarkovGrammar::Interrogative.create(
  base_form: "whose",
  type: "personal",
  is_determiner: true
)

MarkovGrammar::Interrogative.create(
  base_form: "which",
  type: "impersonal",
  is_determiner: true,
  is_pronoun: true
)

MarkovGrammar::Interrogative.create(
  base_form: "what",
  type: "impersonal",
  is_determiner: true,
  is_pronoun: true
)

MarkovGrammar::Interrogative.create(
  base_form: "who",
  type: "personal",
  is_pronoun: true
)

MarkovGrammar::Interrogative.create(
  base_form: "whom",
  type: "personal",
  is_pronoun: true
)

MarkovGrammar::Interrogative.create(
  base_form: "what",
  type: "impersonal",
  is_pronoun: true
)

MarkovGrammar::Interrogative.create(
  base_form: "where",
  type: "location",
  is_proadverb: true
)

MarkovGrammar::Interrogative.create(
  base_form: "whence",
  type: "source",
  is_proadverb: true
)

MarkovGrammar::Interrogative.create(
  base_form: "whither",
  type: "goal",
  is_proadverb: true
)

MarkovGrammar::Interrogative.create(
  base_form: "when",
  type: "time",
  is_proadverb: true
)

MarkovGrammar::Interrogative.create(
  base_form: "how",
  type: "manner",
  is_proadverb: true
)

MarkovGrammar::Interrogative.create(
  base_form: "why",
  type: "manner",
  is_proadverb: true
)

MarkovGrammar::Interrogative.create(
  base_form: "whether",
  type: "choice",
  is_proadverb: true
)
