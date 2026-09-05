import gleam/string

pub fn distance(strand1: String, strand2: String) -> Result(Int, Nil) {
  case string.length(strand1) != string.length(strand2) {
    True -> Error(Nil)
    False -> Ok(dist(strand1, strand2, 0))
  }
}

fn dist(s1: String, s2: String, acc: Int) -> Int {
  case string.first(s1), string.first(s2) {
    Ok(f1), Ok(f2) -> case f1 == f2 {
      True -> dist(string.drop_start(s1, 1), string.drop_start(s2, 1), acc)
      False -> dist(string.drop_start(s1, 1), string.drop_start(s2, 1), acc + 1)
    }
    _, _ -> acc
  }
}