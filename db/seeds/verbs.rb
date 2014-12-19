require './markov_grammar'

MarkovGrammar::Verb.create(
  base_form: "begin",
  is_regular: false,
  is_finite: true,
  ed_form: "began",
  ing_form: "beginning"
)

MarkovGrammar::Verb.create(
  base_form: "sit",
  is_regular: false,
  is_finite: true,
  ed_form: "sat"
)

MarkovGrammar::Verb.create(
  base_form: "peep",
  is_regular: false,
  is_finite: true
)

MarkovGrammar::Verb.create(
  base_form: "read",
  is_finite: true,
  ed_form: "read",
)

MarkovGrammar::Verb.create(
  base_form: "have",
  is_regular: false,
  is_finite: true,
  is_transitive: true,
  is_indicative: true,
  is_linking: true,
  s_form: "has",
  ed_form: "had",
  ing_form: "having"
)

MarkovGrammar::Verb.create(
  base_form: "is",
  is_regular: false,
  is_finite: true,
  is_transitive: true,
  is_indicative: true,
  is_identifying: true,
  ed_form: "was",
  ing_form: "being"
)

MarkovGrammar::Verb.create(
  base_form: "think",
  is_regular: false,
  is_finite: true,
  ed_form: "thought"
)

MarkovGrammar::Verb.create(
  base_form: "hear",
  is_regular: false,
  is_finite: true,
  ed_form: "heard"
)

MarkovGrammar::Verb.create(
  base_form: "look",
  is_regular: true,
  is_finite: true
)

MarkovGrammar::Verb.create(
  base_form: "take",
  is_regular: false,
  is_finite: true,
  ed_form: "took",
  ing_form: "taking"
)

MarkovGrammar::Verb.create(
  base_form: "hurry",
  is_regular: false,
  is_finite: true,
  s_form: "hurries",
  ed_form: "hurried"
)

MarkovGrammar::Verb.create(
  base_form: "see",
  is_regular: false,
  is_finite: true,
  ed_form: "saw"
)

MarkovGrammar::Verb.create(
  base_form: "run",
  is_regular: false,
  is_finite: true,
  ed_form: "ran"
)

MarkovGrammar::Verb.create(
  base_form: "pop",
  is_regular: false,
  is_finite: true,
  ing_form: "popping",
  ed_form: "popped"
)
