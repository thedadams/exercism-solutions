import gleam/string
import gleam/int

pub fn convert(number: Int) -> String {
  let result = case number % 3 == 0 {
    True -> "Pling"
    False -> ""
  }
  let result = result <> case number % 5 == 0 {
    True -> "Plang"
    False -> ""
  }
  let result = result <> case number % 7 == 0 {
    True -> "Plong"
    False -> ""
  }
  case string.length(result) == 0 {
    True -> int.to_string(number)
    False -> result
  }
}
