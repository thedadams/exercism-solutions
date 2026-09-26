import gleam/list
import gleam/string

pub fn recite(inputs: List(String)) -> String {
  case list.first(inputs) {
    Ok(f) -> string.trim(recite_poem(inputs, "") <> "\nAnd all for the want of a " <> f <> ".")
    Error(Nil) -> ""
  }
}

fn recite_poem(inputs: List(String), output: String) -> String {
  case inputs {
    [] | [_] -> output
    [one, two, ..rest] -> recite_poem([two, ..rest], output <> "\nFor want of a " <> one <> " the " <> two <> " was lost.")
  }
}
