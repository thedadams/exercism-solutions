import gleam/result
import gleam/int
import gleam/float

pub type Error {
  InvalidSquare
}

pub fn square(square: Int) -> Result(Int, Error) {
  case square {
    s if s < 1 -> Error(InvalidSquare)
    s if s > 64 -> Error(InvalidSquare)
    _ -> int.power(2, int.to_float(square - 1))
        |> result.replace_error(InvalidSquare)
        |> result.map(float.truncate)
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
