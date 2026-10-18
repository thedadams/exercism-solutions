import gleam/string

pub fn is_valid(isbn: String) -> Bool {
  check(isbn, 10, 0)
}

fn check(isbn: String, multiplier: Int, c: Int) -> Bool {
  case string.pop_grapheme(isbn) {
    Error(Nil) -> multiplier == 0 && c % 11 == 0
    Ok(#(s, rest)) -> case s {
      "-" -> check(rest, multiplier, c)
      "0" -> check(rest, multiplier - 1, c)
      "1" -> check(rest, multiplier - 1, c + multiplier)
      "2" -> check(rest, multiplier - 1, c + 2*multiplier)
      "3" -> check(rest, multiplier - 1, c + 3*multiplier)
      "4" -> check(rest, multiplier - 1, c + 4*multiplier)
      "5" -> check(rest, multiplier - 1, c + 5*multiplier)
      "6" -> check(rest, multiplier - 1, c + 6*multiplier)
      "7" -> check(rest, multiplier - 1, c + 7*multiplier)
      "8" -> check(rest, multiplier - 1, c + 8*multiplier)
      "9" -> check(rest, multiplier - 1, c + 9*multiplier)
      "X" -> case rest {
        "" -> check(rest, multiplier - 1, c + 10*multiplier)
        _ -> False
      }
      _ -> False
    }
  }
}
