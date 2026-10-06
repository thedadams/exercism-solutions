import gleam/float
import gleam/int
import gleam/list
import gleam/result

pub type Error {
  InvalidBase(Int)
  InvalidDigit(Int)
}

pub fn rebase(
  digits digits: List(Int),
  input_base input_base: Int,
  output_base output_base: Int,
) -> Result(List(Int), Error) {
  case input_base <= 1, output_base <= 1 {
    True, _ -> Error(InvalidBase(input_base))
    _, True -> Error(InvalidBase(output_base))
    False, False -> case to_base_ten(digits, input_base, float.truncate(result.unwrap(int.power(input_base, int.to_float(list.length(digits) - 1)), 0.0)), 0) {
      Ok(n) -> Ok(to_base_n(n, output_base, largest_place(n, output_base, 1), []))
      Error(e) -> Error(e)
    }
  }
}

fn to_base_ten(digits: List(Int), base: Int, place: Int, num: Int) -> Result(Int, Error) {
  case digits {
    [] -> Ok(num)
    [first, ..rest] -> case first < 0 || first >= base {
      False -> to_base_ten(rest, base, place / base, num + first * place)
      True -> Error(InvalidDigit(first))
    }
  }
}

fn to_base_n(num: Int, base: Int, place: Int, digits: List(Int)) -> List(Int) {
  case num == 0 {
    True -> case place == 0 {
      False -> to_base_n(num, base, place / base, [0, ..digits])
      True -> case list.is_empty(digits) {
        False -> list.reverse(digits)
        True -> [0]
      }
    }
    False -> to_base_n(num - num / place * place, base, place / base, [num / place, ..digits])
  }
}

fn largest_place(num: Int, base: Int, place: Int) -> Int {
  case place * base {
    n if n > num -> place
    n -> largest_place(num, base, n)
  }
}
