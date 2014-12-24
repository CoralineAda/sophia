MarkovGrammar::Adjective.create(
  base_form: "hot",
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:negative],
  is_physical: true,
  contexts: ["temperature", "physical trait"]
)

MarkovGrammar::Adjective.create(
  base_form: "cold",
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:negative],
  is_physical: true,
  contexts: ["temperature", "physical trait"]
)

MarkovGrammar::Adjective.create(
  base_form: "warm",
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:positive],
  is_physical: true,
  contexts: ["temperature", "physical trait"]
)

MarkovGrammar::Adjective.create(
  base_form: "cool",
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:positive],
  is_physical: true,
  contexts: ["temperature", "physical trait"]
)

MarkovGrammar::Adjective.create(
  base_form: "tepid",
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:negative],
  is_physical: true,
  contexts: ["temperature", "physical trait"]
)

MarkovGrammar::Adjective.create(
  base_form: "sleepy",
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:negative],
  contexts: ["attentiveness"]
)

MarkovGrammar::Adjective.create(
  base_form: "awake",
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:positive],
  contexts: ["attentiveness"]
)

MarkovGrammar::Adjective.create(
  base_form: "stupid",
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:negative],
  contexts: ["knowledge"]
)

MarkovGrammar::Adjective.create(
  base_form: "smart",
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:positive],
  contexts: ["knowledge"]
)

MarkovGrammar::Adjective.create(
  base_form: "remarkable",
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:positive],
  contexts: ["interest"]
)

MarkovGrammar::Adjective.create(
  base_form: "out of the way",
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
  contexts: ["proximity"]
)

MarkovGrammar::Adjective.create(
  base_form: "large",
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
  is_physical: true,
  contexts: ["size", "physical trait"]
)

MarkovGrammar::Adjective.create(
  base_form: "cursed",
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:negative],
  is_physical: false,
  contexts: ["luck"]
)

MarkovGrammar::Adjective.create(
  base_form: "lucky",
  disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:positive],
  is_physical: false,
  contexts: ["luck"]
)

colors = ["black", "dim gray", "dim grey", "gray", "grey", "dark gray", "dark grey", "silver", "light gray", "light grey", "white", "rosy brown", "brown", "brick red", "light coral", "maroon", "dark red", "red", "snow", "salmon", "misty rose", "tomato", "dark salmon", "coral", "orange-red", "light salmon", "sienna", "chocolate", "saddle-brown", "seashell", "sandy brown", "peach", "peru", "linen", "bisque", "dark orange", "tan", "antique white", "blanched almond", "navajo white", "papaya", "orange", "wheat", "goldenrod", "dark goldenrod", "cornsilk", "gold", "lemon yellow", "pale goldenrod", "khaki", "dark khaki", "beige", "light goldenrod", "olive", "ivory", "light yellow", "yellow", "olive drab", "yellow-green", "dark olive green", "green-yellow", "grass-green", "chartreuse", "dark sea green", "forest green", "lime green", "light green", "pale green", "dark green", "green", "lime", "seagreen", "spring green", "mint", "aquamarine", "turquoise", "dark slate gray", "dark slate grey", "pale turquoise", "aqua", "cyan", "dark cyan", "dark turquoise", "teal", "light cyan", "azure", "cadet blue", "powder blue", "light blue", "deep sky blue", "sky blue", "light skyblue", "steel blue", "dodger blue", "slate gray", "slate grey", "light slate gray", "light slate grey", "light steel blue", "cornflower blue", "royal blue", "midnight blue", "lavender", "blue", "dark blue", "medium blue", "navy", "ghost white", "dark slate blue", "slate blue", "medium slate blue", "medium purple", "blue-violet", "indigo", "dark orchid", "dark violet", "plum", "violet", "purple", "dark magenta", "fuchsia", "magenta", "orchid", "deep pink", "hot pink", "crimson", "pink", "light pink"]

colors.each do |color|
  MarkovGrammar::Adjective.create(
    base_form: color,
    is_physical: true,
    disposition: MarkovGrammar::Disposition::HasPositivity::POSITIVITIES[:neutral],
    contexts: ["color", "physical trait"]
  )
end
