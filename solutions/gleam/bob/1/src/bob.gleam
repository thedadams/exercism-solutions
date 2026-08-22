import gleam/string

pub fn hey(remark: String) -> String {
  let remark = string.trim(remark)
  case remark == "" {
    True -> "Fine. Be that way!"
    False -> case string.uppercase(remark) == remark && string.lowercase(remark) != remark {
      True -> case string.ends_with(remark, "?") {
        True -> "Calm down, I know what I'm doing!"
        False -> "Whoa, chill out!"
      }
      False -> case string.ends_with(remark, "?") {
        True -> "Sure."
        False -> "Whatever."
      }
    }
  }
}
