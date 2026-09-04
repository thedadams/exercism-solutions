import gleam/result
import gleam/int

pub type Error {
  InvalidSquare
}

pub fn square(square: Int) -> Result(Int, Error) {
  case square < 1 || square > 64 {
    True -> Error(InvalidSquare)
    False -> Ok(int.bitwise_shift_left(1, square - 1))
  }
}

pub fn total() -> Int {
  total_acc(64, 0)
}

fn total_acc(val: Int, acc: Int) -> Int {
  case val {
    0 -> acc
    _ -> total_acc(val - 1, acc + result.unwrap(square(val), 0))
  }
}
