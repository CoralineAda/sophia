Gramercy::PartOfSpeech::Adjective.create(
  base_form: "hot",
  is_physical: true
).set_root("hot")

Gramercy::PartOfSpeech::Adjective.create(
  base_form: "hot",
  is_physical: true
).set_root("hot")

Gramercy::PartOfSpeech::Adjective.create(
  base_form: "cold",
  disposition: Gramercy::Disposition::HasPositivity::POSITIVITIES[:negative],
  is_physical: true,
  context_names: ["temperature"]
)

Gramercy::PartOfSpeech::Adjective.create(
  base_form: "warm",
  disposition: Gramercy::Disposition::HasPositivity::POSITIVITIES[:positive],
  is_physical: true,
  context_names: ["temperature"]
)

Gramercy::PartOfSpeech::Adjective.create(
  base_form: "cool",
  disposition: Gramercy::Disposition::HasPositivity::POSITIVITIES[:positive],
  is_physical: true,
  context_names: ["temperature"]
)

Gramercy::PartOfSpeech::Adjective.create(
  base_form: "tepid",
  disposition: Gramercy::Disposition::HasPositivity::POSITIVITIES[:negative],
  is_physical: true,
  context_names: ["temperature"]
)

Gramercy::PartOfSpeech::Adjective.create(
  base_form: "sleepy",
  disposition: Gramercy::Disposition::HasPositivity::POSITIVITIES[:negative],
  context_names: ["attentiveness"]
)

Gramercy::PartOfSpeech::Adjective.create(
  base_form: "awake",
  disposition: Gramercy::Disposition::HasPositivity::POSITIVITIES[:positive],
  context_names: ["attentiveness"]
)

Gramercy::PartOfSpeech::Adjective.create(
  base_form: "stupid",
  disposition: Gramercy::Disposition::HasPositivity::POSITIVITIES[:negative],
  context_names: ["knowledge"]
)

Gramercy::PartOfSpeech::Adjective.create(
  base_form: "smart",
  disposition: Gramercy::Disposition::HasPositivity::POSITIVITIES[:positive],
  context_names: ["knowledge"]
)

Gramercy::PartOfSpeech::Adjective.create(
  base_form: "remarkable",
  disposition: Gramercy::Disposition::HasPositivity::POSITIVITIES[:positive],
  context_names: ["interest"]
)

Gramercy::PartOfSpeech::Adjective.create(
  base_form: "out of the way",
  disposition: Gramercy::Disposition::HasPositivity::POSITIVITIES[:neutral],
  context_names: ["proximity"]
)

Gramercy::PartOfSpeech::Adjective.create(
  base_form: "large",
  disposition: Gramercy::Disposition::HasPositivity::POSITIVITIES[:neutral],
  is_physical: true,
  context_names: ["size"]
)

Gramercy::PartOfSpeech::Adjective.create(
  base_form: "cursed",
  disposition: Gramercy::Disposition::HasPositivity::POSITIVITIES[:negative],
  is_physical: false,
  context_names: ["luck"]
)

Gramercy::PartOfSpeech::Adjective.create(
  base_form: "lucky",
  disposition: Gramercy::Disposition::HasPositivity::POSITIVITIES[:positive],
  is_physical: false,
  context_names: ["luck"]
)

colors = ["black", "dim gray", "dim grey", "gray", "grey", "dark gray", "dark grey", "silver", "light gray", "light grey", "white", "rosy brown", "brown", "brick red", "light coral", "maroon", "dark red", "red", "snow", "salmon", "misty rose", "tomato", "dark salmon", "coral", "orange-red", "light salmon", "sienna", "chocolate", "saddle-brown", "seashell", "sandy brown", "peach", "peru", "linen", "bisque", "dark orange", "tan", "antique white", "blanched almond", "navajo white", "papaya", "orange", "wheat", "goldenrod", "dark goldenrod", "cornsilk", "gold", "lemon yellow", "pale goldenrod", "khaki", "dark khaki", "beige", "light goldenrod", "olive", "ivory", "light yellow", "yellow", "olive drab", "yellow-green", "dark olive green", "green-yellow", "grass-green", "chartreuse", "dark sea green", "forest green", "lime green", "light green", "pale green", "dark green", "green", "lime", "seagreen", "spring green", "mint", "aquamarine", "turquoise", "dark slate gray", "dark slate grey", "pale turquoise", "aqua", "cyan", "dark cyan", "dark turquoise", "teal", "light cyan", "azure", "cadet blue", "powder blue", "light blue", "deep sky blue", "sky blue", "light skyblue", "steel blue", "dodger blue", "slate gray", "slate grey", "light slate gray", "light slate grey", "light steel blue", "cornflower blue", "royal blue", "midnight blue", "lavender", "blue", "dark blue", "medium blue", "navy", "ghost white", "dark slate blue", "slate blue", "medium slate blue", "medium purple", "blue-violet", "indigo", "dark orchid", "dark violet", "plum", "violet", "purple", "dark magenta", "fuchsia", "magenta", "orchid", "deep pink", "hot pink", "crimson", "pink", "light pink"]

colors.each do |color|
  Gramercy::PartOfSpeech::Adjective.create(
    base_form: color,
    is_physical: true,
    disposition: Gramercy::Disposition::HasPositivity::POSITIVITIES[:neutral],
    context_names: ["color"]
  )
end
