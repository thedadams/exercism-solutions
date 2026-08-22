pub fn is_leap_year(year: Int) -> Bool {
  case year % 400 == 0 {
    True -> True
    False -> case year % 100 == 0 {
      True -> False
      False -> year % 4 == 0
    }
  }
}
