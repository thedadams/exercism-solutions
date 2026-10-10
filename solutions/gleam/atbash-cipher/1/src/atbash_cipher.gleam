import gleam/list
import gleam/string

pub fn encode(phrase: String) -> String {
  phrase
  |> string.lowercase
  |> string.to_graphemes
  |> list.map(sub_letter)
  |> list.filter(fn(s) { !string.is_empty(s) })
  |> list.sized_chunk(5)
  |> list.map(fn(a) { string.join(a, "")})
  |> string.join(" ")
}

fn sub_letter(l: String) -> String {
  case l {
    "a" -> "z"
    "b" -> "y"
    "c" -> "x"
    "d" -> "w"
    "e" -> "v"
    "f" -> "u"
    "g" -> "t"
    "h" -> "s"
    "i" -> "r"
    "j" -> "q"
    "k" -> "p"
    "l" -> "o"
    "m" -> "n"
    "n" -> "m"
    "o" -> "l"
    "p" -> "k"
    "q" -> "j"
    "r" -> "i"
    "s" -> "h"
    "t" -> "g"
    "u" -> "f"
    "v" -> "e"
    "w" -> "d"
    "x" -> "c"
    "y" -> "b"
    "z" -> "a"
    "0" -> "0"
    "1" -> "1"
    "2" -> "2"
    "3" -> "3"
    "4" -> "4"
    "5" -> "5"
    "6" -> "6"
    "7" -> "7"
    "8" -> "8"
    "9" -> "9"
    _ -> ""
  }
}

pub fn decode(phrase: String) -> String {
  phrase
  |> string.to_graphemes
  |> list.map(sub_letter)
  |> string.join("")
}
