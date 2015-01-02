word = Gramercy::PartOfSpeech::Generic.find_or_create_by( base_form: 'a', type: 'article' )
word.set_property('plurality', 'singular')
word.set_property('indefinite', 'true')

word = Gramercy::PartOfSpeech::Generic.find_or_create_by( base_form: 'an', type: 'article' )
word.set_property('plurality', 'singular')
word.set_property('indefinite', 'true')

word = Gramercy::PartOfSpeech::Generic.find_or_create_by( base_form: 'one', type: 'article' )
word.set_property('plurality', 'singular')
word.set_property('indefinite', 'true')

word = Gramercy::PartOfSpeech::Generic.find_or_create_by( base_form: 'some', type: 'article' )
word.set_property('plurality', 'plural')
word.set_property('indefinite', 'true')

word = Gramercy::PartOfSpeech::Generic.find_or_create_by( base_form: 'few', type: 'article' )
word.set_property('plurality', 'plural')
word.set_property('indefinite', 'true')

word = Gramercy::PartOfSpeech::Generic.find_or_create_by( base_form: 'the', type: 'article' )
word.set_property('plurality', 'singular')
word.set_property('definite', 'true')

word = Gramercy::PartOfSpeech::Generic.find_or_create_by( base_form: 'that', type: 'article' )
word.set_property('plurality', 'singular')
word.set_property('definite', 'true')

word = Gramercy::PartOfSpeech::Generic.find_or_create_by( base_form: 'those', type: 'article' )
word.set_property('plurality', 'plural')
word.set_property('definite', 'true')

word = Gramercy::PartOfSpeech::Generic.find_or_create_by( base_form: 'most', type: 'article' )
word.set_property('plurality', 'plural')
word.set_property('indefinite', 'true')

word = Gramercy::PartOfSpeech::Generic.find_or_create_by( base_form: 'many', type: 'article' )
word.set_property('plurality', 'plural')
word.set_property('indefinite', 'true')

word = Gramercy::PartOfSpeech::Generic.find_or_create_by( base_form: 'some', type: 'article' )
word.set_property('plurality', 'plural')
word.set_property('definite', 'true')

