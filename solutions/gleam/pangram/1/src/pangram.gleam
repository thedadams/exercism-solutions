import gleam/string
import gleam/list
import gleam/set

pub fn is_pangram(sentence: String) -> Bool {
  sentence
  |> string.lowercase
  |> string.to_utf_codepoints
  |> list.filter(fn(a) { string.utf_codepoint_to_int(a) >= 97 && string.utf_codepoint_to_int(a) <= 123 }) 
  |> set.from_list 
  |> set.size == 26
}
