pub type Classification {
  Perfect
  Abundant
  Deficient
}

pub type Error {
  NonPositiveInt
}

pub fn classify(number: Int) -> Result(Classification, Error) {
  case number {
    n if n <= 0 -> Error(NonPositiveInt)
    _ -> Ok(classify_number(number, 1, 0))
  }
}

fn classify_number(n: Int, d: Int, s: Int) -> Classification {
  case d < n {
    True -> case n % d == 0 {
      True -> classify_number(n, d + 1, s + d)
      False -> classify_number(n , d + 1, s)
    }
    False -> case s {
      s if s < n -> Deficient
      s if s > n -> Abundant
      _ -> Perfect
    }
  }
}
