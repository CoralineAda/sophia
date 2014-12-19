MarkovGrammar.talk.about('book', disposition: :positive, context: 'color')
MarkovGrammar.sentence.with_subject('Coraline').with_disposition(:positive).generate

MarkovGrammar.sentence.with_subject('Coraline').with_disposition(:positive).render