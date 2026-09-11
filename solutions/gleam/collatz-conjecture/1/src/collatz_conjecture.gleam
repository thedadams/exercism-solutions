pub type Error {
  NonPositiveNumber
}

pub fn steps(number: Int) -> Result(Int, Error) {
  case number {
    n if n <= 0 -> Error(NonPositiveNumber)
    _ -> Ok(count_steps(number, 0))
  }
}

fn count_steps(number: Int, count: Int) -> Int {
  case number {
    1 -> count
    n if n % 2 == 0 -> count_steps(number / 2, count + 1)
    _ -> count_steps(3 * number + 1, count + 1)
  }
}
