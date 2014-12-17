require 'rubyfish'
require 'lingua/stemmer'

module Grammar
  module PartsOfSpeech

    WORD_LIST = {
      article:         %w{a the of an to},
      greeting:        %w{ hi hello evening morning hii hiii hiiii guten ohai hai ahoy yo heya},
      adverb:          %w{ enough not as beyond just actually very never always lately recently quickly slowly deliberately },
      conjunction:     %w{ accordingly after also although and assuming because before besides but consequently conversely even for furthermore hence how however if instead lest likewise meanwhile moreover nevertheless nonetheless nor now once or otherwise provided rather since so that so still than that then therefore though thus till unless until what whatever when whenever whereas whether which whichever while why yet wherever },
      interrogative:   %w{ how what who when where },
      number:          %w{ one two three four five six seven eight nine ten twenty thirty forty fifty sixty seventy eighty ninety hundred thousand million },
      preposition:     %w{ under over across about at by for from in into of on onto to toward towards with within without },
      pronoun:         %w{ everyone noone none there either neither him her his him hers they theirs them he she it its this those these that },
      action_verb:     %w{ kick join go use speak spoke annoy join pop burn flash hurry talk start stop jump eat fly walk run ran go say tell say said greet welcome thank do does did hurry },
      possessive_verb: %w{ get got have has had possess own rent hold held take took },
      identity_verb:   %w{ seem be been am are is was stop need want care owe exist },
      feeling_verb:    %w{ love hate feel like think thought },
      sensory_verb:    %w{ watch look feel felt see saw seen hear hear taste smell touch },
      creative_verb:   %w{ made make forge brew },
      transfer_verb:   %w{ donate drop gave give get hand pass pick take },
      other_verb:      ["accept", "add", "admire", "admit", "advise", "afford", "agree", "alert", "allow", "amuse", "analyse", "announce", "annoy", "answer", "apologise", "appear", "applaud", "appreciate", "approve", "argue", "arrange", "arrest", "arrive", "ask", "attach", "attack", "attempt", "attend", "attract", "avoid", "back", "bake", "balance", "ban", "bang", "bare", "bat", "bathe", "battle", "beam", "beg", "behave", "belong", "bleach", "bless", "blind", "blink", "blot", "blush", "boast", "boil", "bolt", "bomb", "book", "bore", "borrow", "bounce", "bow", "box", "brake", "branch", "breathe", "bruise", "brush", "bubble", "bump", "burn", "bury", "buzz", "calculate", "call", "camp", "care", "carry", "carve", "cause", "challenge", "change", "charge", "chase", "cheat", "check", "cheer", "chew", "choke", "chop", "claim", "clap", "clean", "clear", "clip", "close", "coach", "coil", "collect", "colour", "comb", "command", "communicate", "compare", "compete", "complain", "complete", "concentrate", "concern", "confess", "confuse", "connect", "consider", "consist", "contain", "continue", "copy", "correct", "cough", "count", "cover", "crack", "crash", "crawl", "cross", "crush", "cry", "cure", "curl", "curve", "cycle", "dam", "damage", "dance", "dare", "decay", "deceive", "decide", "decorate", "delay", "delight", "deliver", "depend", "describe", "desert", "deserve", "destroy", "detect", "develop", "disagree", "disappear", "disapprove", "disarm", "discover", "dislike", "divide", "double", "doubt", "drag", "drain", "dream", "dress", "drip", "drop", "drown", "drum", "dry", "dust", "earn", "educate", "embarrass", "employ", "empty", "encourage", "end", "enjoy", "enter", "entertain", "escape", "examine", "excite", "excuse", "exercise", "exist", "expand", "expect", "explain", "explode", "extend", "face", "fade", "fail", "fancy", "fasten", "fax", "fear", "fence", "fetch", "file", "fill", "film", "fire", "fit", "fix", "flap", "flash", "float", "flood", "flow", "flower", "fold", "follow", "fool", "force", "form", "found", "frame", "frighten", "fry", "gather", "gaze", "glow", "glue", "grab", "grate", "grease", "greet", "grin", "grip", "groan", "guarantee", "guard", "guess", "guide", "hammer", "hand", "handle", "hang", "happen", "harass", "harm", "hate", "haunt", "head", "heal", "heap", "heat", "help", "hook", "hop", "hope", "hover", "hug", "hum", "hunt", "hurry", "identify", "ignore", "imagine", "impress", "improve", "include", "increase", "influence", "inform", "inject", "injure", "instruct", "intend", "interest", "interfere", "interrupt", "introduce", "invent", "invite", "irritate", "itch", "jail", "jam", "jog", "join", "joke", "judge", "juggle", "jump", "kick", "kill", "kiss", "kneel", "knit", "knock", "knot", "label", "land", "last", "laugh", "launch", "learn", "level", "license", "lick", "lie", "lighten", "like", "list", "listen", "live", "load", "lock", "long", "look", "love", "man", "manage", "march", "mark", "marry", "match", "mate", "matter", "measure", "meddle", "melt", "memorise", "mend", "mess up", "milk", "mine", "miss", "mix", "moan", "moor", "mourn", "move", "muddle", "mug", "multiply", "murder", "nail", "name", "need", "nest", "nod", "note", "notice", "number", "obey", "object", "observe", "obtain", "occur", "offend", "offer", "open", "order", "overflow", "owe", "own", "pack", "paddle", "paint", "park", "part", "pass", "paste", "pat", "pause", "peck", "pedal", "peel", "peep", "perform", "permit", "phone", "pick", "pinch", "pine", "place", "plan", "plant", "play", "please", "plug", "point", "poke", "polish", "pop", "possess", "post", "pour", "practise", "pray", "preach", "precede", "prefer", "prepare", "present", "preserve", "press", "pretend", "prevent", "prick", "print", "produce", "program", "promise", "protect", "provide", "pull", "pump", "punch", "puncture", "punish", "push", "question", "queue",  "race", "radiate", "rain", "raise", "reach", "realise", "receive", "recognise", "record", "reduce", "reflect", "refuse", "regret", "reign", "reject", "rejoice", "relax", "release", "rely", "remain", "remember", "remind", "remove", "repair", "repeat", "replace", "reply", "report", "reproduce", "request", "rescue", "retire", "return", "rhyme", "rinse", "risk", "rob", "rock", "roll", "rot", "rub", "ruin", "rule", "rush", "sack", "sail", "satisfy", "save", "saw", "scare", "scatter", "scold", "scorch", "scrape", "scratch", "scream", "screw", "scribble", "scrub", "seal", "search", "separate", "serve", "settle", "shade", "share", "shave", "shelter", "shiver", "shock", "shop", "shrug", "sigh", "sign", "signal", "sin", "sip", "ski", "skip", "slap", "slip", "slow", "smash", "smell", "smile", "smoke", "snatch", "sneeze", "sniff", "snore", "snow", "soak", "soothe", "sound", "spare", "spark", "sparkle", "spell", "spill", "spoil", "spot", "spray", "sprout", "squash", "squeak", "squeal", "squeeze", "stain", "stamp", "stare", "start", "stay", "steer", "step", "stir", "stitch", "stop", "store", "strap", "strengthen", "stretch", "strip", "stroke", "stuff", "subtract", "succeed", "suck", "suffer", "suggest", "suit", "supply", "support", "suppose", "surprise", "surround", "suspect", "suspend", "switch", "talk", "tame", "tap", "taste", "tease", "telephone", "tempt", "terrify", "test", "thank", "thaw", "tick", "tickle", "tie", "time", "tip", "tire", "touch", "tour", "tow", "trace", "trade", "train", "transport", "trap", "travel", "treat", "tremble", "trick", "trip", "trot", "trouble", "trust", "try", "tug", "tumble", "turn", "twist", "type", "undress", "unfasten", "unite", "unlock", "unpack", "untidy", "use", "vanish", "visit",  "wail", "wait", "walk", "wander", "want", "warm", "warn", "wash", "waste", "watch", "water", "wave", "weigh", "welcome", "whine", "whip", "whirl", "whisper", "whistle", "wink", "wipe", "wish", "wobble", "wonder", "work", "worry", "wrap", "wreck", "wrestle", "wriggle", "x-ray",  "yawn", "yell",  "zip", "zoom"]
    }

    VERBS = WORD_LIST[:action_verb] +
            WORD_LIST[:possessive_verb] +
            WORD_LIST[:identity_verb] +
            WORD_LIST[:feeling_verb] +
            WORD_LIST[:sensory_verb] +
            WORD_LIST[:creative_verb] +
            WORD_LIST[:transfer_verb]

    HONORIFICS = %w{dr. mr. ms. mrs. rev.}

    NOUN_INDICATORS = WORD_LIST[:article]

    IDENTIFIERS = WORD_LIST[:article] + WORD_LIST[:number]

    PREDICATE_INDICATORS = WORD_LIST[:preposition] + NOUN_INDICATORS + VERBS

    def self.similar_to(original_word, test_word)
      return true if Lingua.stemmer(original_word.downcase) == Lingua.stemmer(test_word.downcase)
      distance = RubyFish::Hamming.distance(original_word, test_word)
      original_word.length > 5 && distance < original_word.length * 0.5 ? true : false
    end

    def self.probable_nouns_from(text)
      text = text.to_s
      re = Regexp.union((PREDICATE_INDICATORS).flatten.map{|w| /\b#{Regexp.escape(w)}\b/i})
      candidates = text.split(re).map(&:split).flatten.map(&:downcase)
      candidates.reject!{|c| PREDICATE_INDICATORS.include?(c) }
      candidates = candidates.map{|c| c.gsub(/[^a-zA-Z]/x, " ")}.compact
      candidates = candidates.map(&:split).flatten.compact
    end

  end
end
