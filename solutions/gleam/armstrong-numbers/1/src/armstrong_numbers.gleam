import gleam/int.{add}

pub fn is_armstrong_number(number: Int) -> Bool {
  number == sum_digits(number, num_digits(number))
}

fn num_digits(number: Int) -> Int {
  case number {
    0 -> 0
    _ -> 1 + num_digits(number / 10)
  }
}

fn sum_digits(number: Int, pow: Int) -> Int {
  case number {
    0 -> 0
    _ -> number % 10 |> int_power(pow) |> add(sum_digits(number / 10, pow))
  }
}


fn int_power(base: Int, pow: Int) -> Int {
  case pow {
    0 -> 1
    _ -> base * int_power(base, pow - 1)
  }
}