import gleam/option.{type Option, Some, None}

pub fn two_fer(name: Option(String)) -> String {
  let n = case name {
    Some(n) -> n
    None -> "you"
  }

  "One for " <> n <> ", one for me."
}
