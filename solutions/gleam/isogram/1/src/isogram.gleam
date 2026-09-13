import gleam/list
import gleam/set
import gleam/string

pub fn is_isogram(phrase phrase: String) -> Bool {
  let letters = phrase
  |> string.lowercase
  |> string.to_utf_codepoints
  |> list.map(string.utf_codepoint_to_int)
  |> list.filter(fn(a) {a >= 97 && a <= 122})

  list.length(letters) == set.size(set.from_list(letters))
}
