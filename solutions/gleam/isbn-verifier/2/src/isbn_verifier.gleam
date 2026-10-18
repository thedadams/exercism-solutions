import gleam/int
import gleam/string

pub fn is_valid(isbn: String) -> Bool {
  check(string.to_graphemes(isbn), 10, 0)
}

fn check(isbn: List(String), multiplier: Int, c: Int) -> Bool {
  case isbn {
    [] -> multiplier == 0 && c % 11 == 0
    ["-", ..rest] -> check(rest, multiplier, c)
    ["X"] -> check([], multiplier - 1 , c + 10 * multiplier)
    [x, ..rest] -> case int.parse(x) {
      Ok(i) -> check(rest, multiplier - 1, c + i * multiplier)
      Error(_) -> False
    }
  }
}
