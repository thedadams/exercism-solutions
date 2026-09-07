pub fn recite(start_verse start_verse: Int, end_verse end_verse: Int) -> String {
  let res = recite_verses(start_verse, "This is")

  case start_verse == end_verse {
    True -> res
    False -> res <> "\n" <> recite(start_verse + 1, end_verse)
  }
}

fn recite_verses(start: Int, acc: String) -> String {
  let a = acc <> case start {
    1 -> " the house that Jack built."
    2 -> " the malt that lay in"
    3 -> " the rat that ate"
    4 -> " the cat that killed"
    5 -> " the dog that worried"
    6 -> " the cow with the crumpled horn that tossed"
    7 -> " the maiden all forlorn that milked"
    8 -> " the man all tattered and torn that kissed"
    9 -> " the priest all shaven and shorn that married"
    10 -> " the rooster that crowed in the morn that woke"
    11 -> " the farmer sowing his corn that kept"
    12 -> " the horse and the hound and the horn that belonged to"
    _ -> ""
  }

  case start == 1 {
    True -> a
    False -> recite_verses(start - 1 , a)
  }
}
