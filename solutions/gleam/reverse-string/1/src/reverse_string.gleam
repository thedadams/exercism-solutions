import gleam/string

pub fn reverse(value: String) -> String {
  case string.first(value) {
    Ok(c) -> string.append(reverse(string.drop_start(value, 1)), c)
    _ -> ""
  }
}
