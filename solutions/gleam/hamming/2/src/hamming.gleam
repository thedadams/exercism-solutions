import gleam/string
import gleam/list
import gleam/result

pub fn distance(strand1: String, strand2: String) -> Result(Int, Nil) {
  list.strict_zip(string.to_graphemes(strand1), string.to_graphemes(strand2))
  |> result.map(list.count(_, fn(p) { p.0 != p.1}))
}
