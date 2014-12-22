require './markov_grammar'

MarkovGrammar::Adverb.create(
  base_form: "quickly",
  is_manner: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:positive],
  contexts: ["locomotion", "speed"]
)

MarkovGrammar::Adverb.create(
  base_form: "slowly",
  is_manner: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:negative],
  contexts: ["locomotion", "speed"]
)

MarkovGrammar::Adverb.create(
  base_form: "sloppily",
  is_manner: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:negative],
  contexts: ["precision"]
)

MarkovGrammar::Adverb.create(
  base_form: "carefully",
  is_manner: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:positive],
  contexts: ["precision"]
)

MarkovGrammar::Adverb.create(
  base_form: "correctly",
  is_manner: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:positive],
  contexts: ["precision"]
)

MarkovGrammar::Adverb.create(
  base_form: "eagerly",
  is_manner: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:positive],
  contexts: ["demeanor"]
)

MarkovGrammar::Adverb.create(
  base_form: "easily",
  is_manner: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:positive],
  contexts: ["demeanor", "skill"]
)


MarkovGrammar::Adverb.create(
  base_form: "quietly",
  is_manner: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
  contexts: ["emote", "sense", "audio"]
)

MarkovGrammar::Adverb.create(
  base_form: "patiently",
  is_manner: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:negative],
  contexts: ["demeanor"]
)

MarkovGrammar::Adverb.create(
  base_form: "abroad",
  is_place: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
  contexts: ["place", "proximity"]
)

MarkovGrammar::Adverb.create(
  base_form: "anywhere",
  is_place: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
  contexts: ["place", "proximity"]
)

MarkovGrammar::Adverb.create(
  base_form: "nowhere",
  is_place: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:negative],
  contexts: ["place", "proximity"]
)

MarkovGrammar::Adverb.create(
  base_form: "somewhere",
  is_place: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:positive],
  contexts: ["place", "proximity"]
)

MarkovGrammar::Adverb.create(
  base_form: "accidentally",
  is_purpose: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:negative],
  contexts: ["demeanor"]
)

MarkovGrammar::Adverb.create(
  base_form: "purposely",
  is_purpose: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:positive],
  contexts: ["demeanor"]
)

MarkovGrammar::Adverb.create(
  base_form: "intentionally",
  is_purpose: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:positive],
  contexts: ["demeanor"]
)

MarkovGrammar::Adverb.create(
  base_form: "always",
  is_frequency: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:positive],
)

MarkovGrammar::Adverb.create(
  base_form: "very",
  is_verbal: false,
  is_adjectival: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:positive],
)

MarkovGrammar::Adverb.create(
  base_form: "never",
  is_frequency: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:negative],
)

MarkovGrammar::Adverb.create(
  base_form: "often",
  is_frequency: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:positive],
)

MarkovGrammar::Adverb.create(
  base_form: "rarely",
  is_frequency: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:negative],
)

MarkovGrammar::Adverb.create(
  base_form: "seldom",
  is_frequency: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:negative],
)

MarkovGrammar::Adverb.create(
  base_form: "sometimes",
  is_frequency: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
)

MarkovGrammar::Adverb.create(
  base_form: "usually",
  is_frequency: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:positive],
)

MarkovGrammar::Adverb.create(
  base_form: "after",
  is_time: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
)

MarkovGrammar::Adverb.create(
  base_form: "already",
  is_time: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
)

MarkovGrammar::Adverb.create(
  base_form: "before",
  is_time: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
)

MarkovGrammar::Adverb.create(
  base_form: "during",
  is_time: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
)

MarkovGrammar::Adverb.create(
  base_form: "finally",
  is_time: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
)

MarkovGrammar::Adverb.create(
  base_form: "just",
  is_time: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
)

MarkovGrammar::Adverb.create(
  base_form: "later",
  is_time: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
)

MarkovGrammar::Adverb.create(
  base_form: "last",
  is_time: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
)

MarkovGrammar::Adverb.create(
  base_form: "next",
  is_time: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
)

MarkovGrammar::Adverb.create(
  base_form: "now",
  is_time: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
)

MarkovGrammar::Adverb.create(
  base_form: "recently",
  is_time: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
)

MarkovGrammar::Adverb.create(
  base_form: "soon",
  is_time: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
)

MarkovGrammar::Adverb.create(
  base_form: "then",
  is_time: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
)

MarkovGrammar::Adverb.create(
  base_form: "while",
  is_time: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
)

MarkovGrammar::Adverb.create(
  base_form: "tomorrow",
  is_time: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
)

MarkovGrammar::Adverb.create(
  base_form: "yesterday",
  is_time: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
)

MarkovGrammar::Adverb.create(
  base_form: "today",
  is_time: true,
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
)

