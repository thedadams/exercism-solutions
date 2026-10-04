import gleam/list
import gleam/string
import gleam/result

pub fn abbreviate(phrase phrase: String) -> String {
  phrase
  |> string.replace("-", " ")
  |> string.replace("_", " ")
  |> string.split(" ")
  |> list.map(string.first)
  |> result.values
  |> string.join("")
  |> string.uppercase
}
