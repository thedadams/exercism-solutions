import gleam/list
import gleam/string

pub fn recite(start_verse start_verse: Int, end_verse end_verse: Int) -> String {
  list.range(start_verse, end_verse)
  |> list.map(verse)
  |> string.join("\n")
}

fn verse(num: Int) -> String {
  list.range(num, 1)
  |> list.map(line)
  |> string.join(" ")
  |> string.append("This is ", _)
}

fn line(start: Int) -> String {
  case start {
    1 -> "the house that Jack built."
    2 -> "the malt that lay in"
    3 -> "the rat that ate"
    4 -> "the cat that killed"
    5 -> "the dog that worried"
    6 -> "the cow with the crumpled horn that tossed"
    7 -> "the maiden all forlorn that milked"
    8 -> "the man all tattered and torn that kissed"
    9 -> "the priest all shaven and shorn that married"
    10 -> "the rooster that crowed in the morn that woke"
    11 -> "the farmer sowing his corn that kept"
    12 -> "the horse and the hound and the horn that belonged to"
    _ -> ""
  }
}
