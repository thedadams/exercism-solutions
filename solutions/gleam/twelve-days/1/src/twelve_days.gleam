import gleam/string

pub fn verse(number: Int) -> String {
  verse_countdown(number, "On the " <> day(number) <> " day of Christmas my true love gave to me: ")
}

fn day(number: Int) -> String {
  case number {
    1 -> "first"
    2 -> "second"
    3 -> "third"
    4 -> "fourth"
    5 -> "fifth"
    6 -> "sixth"
    7 -> "seventh"
    8 -> "eighth"
    9 -> "ninth"
    10 -> "tenth"
    11 -> "eleventh"
    12 -> "twelfth"
    _ -> panic as "unreachable"
  }
}

fn verse_countdown(number: Int, acc: String) -> String {
  case number {
    1 -> acc <> "a Partridge in a Pear Tree."
    2 -> verse_countdown(number - 1, acc <> "two Turtle Doves, and ")
    3 -> verse_countdown(number - 1, acc <> "three French Hens, ")
    4 -> verse_countdown(number - 1, acc <> "four Calling Birds, ")
    5 -> verse_countdown(number - 1, acc <> "five Gold Rings, ")
    6 -> verse_countdown(number - 1, acc <> "six Geese-a-Laying, ")
    7 -> verse_countdown(number - 1, acc <> "seven Swans-a-Swimming, ")
    8 -> verse_countdown(number - 1, acc <> "eight Maids-a-Milking, ")
    9 -> verse_countdown(number - 1, acc <> "nine Ladies Dancing, ")
    10 -> verse_countdown(number - 1, acc <> "ten Lords-a-Leaping, ")
    11 -> verse_countdown(number - 1, acc <> "eleven Pipers Piping, ")
    12 -> verse_countdown(number - 1, acc <> "twelve Drummers Drumming, ")
    _ -> panic as "unreachable"
  }
}

pub fn lyrics(from starting_verse: Int, to ending_verse: Int) -> String {
  lyrics_acc(starting_verse, ending_verse, "")
}

fn lyrics_acc(from: Int, to: Int, acc: String) -> String {
  case from > to {
    True -> string.trim(acc)
    False -> lyrics_acc(from + 1, to, acc <> verse(from) <> "\n")
  }
}
