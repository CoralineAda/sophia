word = Gramercy::PartOfSpeech::Generic.create!( base_form: 'whose', type: 'interrogative')
word.set_property('type', 'personal')
word.set_property('determiner', 'true')

word = Gramercy::PartOfSpeech::Generic.create!( base_form: 'which', type: 'interrogative')
word.set_property('impersonal', 'true')
word.set_property('determiner', 'true')
word.set_property('pronoun', 'true')

word = Gramercy::PartOfSpeech::Generic.create!( base_form: 'what', type: 'interrogative')
word.set_property('impersonal', 'true')
word.set_property('determiner', 'true')
word.set_property('pronoun', 'true')

word = Gramercy::PartOfSpeech::Generic.create!( base_form: 'who', type: 'interrogative')
word.set_property('type', 'personal')
word.set_property('pronoun', 'true')

word = Gramercy::PartOfSpeech::Generic.create!( base_form: 'whom', type: 'interrogative')
word.set_property('type', 'personal')
word.set_property('pronoun', 'true')

word = Gramercy::PartOfSpeech::Generic.create!( base_form: 'what', type: 'interrogative')
word.set_property('impersonal', 'true')
word.set_property('pronoun', 'true')

word = Gramercy::PartOfSpeech::Generic.create!( base_form: 'where', type: 'interrogative')
word.set_property('type', 'location')
word.set_property('is_proadverb', 'true')

word = Gramercy::PartOfSpeech::Generic.create!( base_form: 'whence', type: 'interrogative')
word.set_property('type', 'source')
word.set_property('is_proadverb', 'true')

word = Gramercy::PartOfSpeech::Generic.create!( base_form: 'whither', type: 'interrogative')
word.set_property('type', 'goal')
word.set_property('is_proadverb', 'true')

word = Gramercy::PartOfSpeech::Generic.create!( base_form: 'when', type: 'interrogative')
word.set_property('type', 'time')
word.set_property('is_proadverb', 'true')

word = Gramercy::PartOfSpeech::Generic.create!( base_form: 'how', type: 'interrogative')
word.set_property('type', 'manner')
word.set_property('is_proadverb', 'true')

word = Gramercy::PartOfSpeech::Generic.create!( base_form: 'why', type: 'interrogative')
word.set_property('type', 'manner')
word.set_property('is_proadverb', 'true')

word = Gramercy::PartOfSpeech::Generic.create!( base_form: 'whether', type: 'interrogative')
word.set_property('type', 'choice')
word.set_property('is_proadverb', 'true')
