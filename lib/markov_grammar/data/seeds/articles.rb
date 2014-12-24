MarkovGrammar::Article.create(
  base_form: "a",
  plurality: :singular,
  is_indefinite: true
)

MarkovGrammar::Article.create(
  base_form: "an",
  plurality: :singular,
  is_indefinite: true
)

MarkovGrammar::Article.create(
  base_form: "one",
  plurality: :singular,
  is_indefinite: true
)

MarkovGrammar::Article.create(
  base_form: "some",
  plurality: :plural,
  is_indefinite: true
)

MarkovGrammar::Article.create(
  base_form: "few",
  plurality: :plural,
  is_indefinite: true
)

MarkovGrammar::Article.create(
  base_form: "the",
  is_indefinite: false
)

MarkovGrammar::Article.create(
  base_form: "that",
  plurality: :singular,
  is_indefinite: false
)

MarkovGrammar::Article.create(
  base_form: "most",
  plurality: :plural,
  is_indefinite: true
)

MarkovGrammar::Article.create(
  base_form: "many",
  plurality: :plural,
  is_indefinite: true
)

MarkovGrammar::Article.create(
  base_form: "some",
  plurality: :plural,
  is_indefinite: false
)
