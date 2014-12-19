require './markov_grammar'

MarkovGrammar::Verb.create(
  base_form: "begin",
  contexts: ["action", "process"],
  is_finite: true,
  ed_form: "began",
  ing_form: "beginning"
)

MarkovGrammar::Verb.create(
  base_form: "sit",
  contexts: ["action", "motion", "position"],
  is_finite: true,
  ed_form: "sat",
  ing_form: "sitting"
)

MarkovGrammar::Verb.create(
  base_form: "peep",
  contexts: ["action", "observation"],
  is_finite: true
)

MarkovGrammar::Verb.create(
  base_form: "read",
  contexts: ["action", "information"],
  is_finite: true,
  ed_form: "read",
)

MarkovGrammar::Verb.create(
  base_form: "have",
  contexts: ["possession", "trait", "physical trait"],
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
  contexts: ["identity"],
  is_finite: true,
  is_transitive: true,
  is_indicative: true,
  is_identifying: true,
  ed_form: "was",
  ing_form: "being"
)

MarkovGrammar::Verb.create(
  base_form: "think",
  contexts: ["action", "information"],
  is_finite: true,
  ed_form: "thought"
)

MarkovGrammar::Verb.create(
  base_form: "hear",
  contexts: ["action", "sense"],
  is_finite: true,
  ed_form: "heard"
)

MarkovGrammar::Verb.create(
  base_form: "look",
  contexts: ["action", "sense"],
  is_finite: true
)

MarkovGrammar::Verb.create(
  base_form: "take",
  contexts: ["action", "possession"],
  is_finite: true,
  ed_form: "took",
  ing_form: "taking"
)

MarkovGrammar::Verb.create(
  base_form: "hurry",
  contexts: ["action", "motion"],
  is_finite: true,
  s_form: "hurries",
  ed_form: "hurried"
)

MarkovGrammar::Verb.create(
  base_form: "see",
  contexts: ["action", "sense"],
  is_finite: true,
  ed_form: "saw",
  ing_form: "seeing"
)

MarkovGrammar::Verb.create(
  base_form: "run",
  contexts: ["action", "motion"],
  is_finite: true,
  ed_form: "ran",
  ing_form: "running"
)

MarkovGrammar::Verb.create(
  base_form: "pop",
  contexts: ["action", "motion"],
  is_finite: true,
  ing_form: "popping",
  ed_form: "popped"
)

MarkovGrammar::Verb.create(
  base_form: "say",
  contexts: ["action", "information"],
  is_finite: true,
  ed_form: "said"
)

MarkovGrammar::Verb.create(
  base_form: "go",
  contexts: ["action", "motion"],
  is_finite: true,
  s_form: "goes",
  ed_form: "went"
)

MarkovGrammar::Verb.create(
  base_form: "get",
  contexts: ["action", "motion", "possession"],
  ed_form: "got"
)

MarkovGrammar::Verb.create(
  base_form: "make",
  contexts: ["action", "creation"],
  ing_form: "making",
  ed_form: "made"
)

MarkovGrammar::Verb.create(
  base_form: "know",
  contexts: ["information"],
  ed_form: "knew"
)

