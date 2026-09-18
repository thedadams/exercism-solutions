pub fn prime(number: Int) -> Result(Int, Nil) {
  case number {
    n if n <= 0 -> Error(Nil)
    _ -> Ok(prime_counter(2, number))
  }
}

fn prime_counter(number: Int, count: Int) -> Int {
  case is_prime(number), count == 1 {
    True, True -> number
    True, False -> prime_counter(number+1, count-1)
    _, _ -> prime_counter(number+1, count)
  }
}

fn is_prime(n: Int) -> Bool {
  compute_is_prime(n, 2)
}

fn compute_is_prime(n: Int, i: Int) -> Bool {
  case n % i == 0 {
    True -> n == i
    False -> compute_is_prime(n, i+1)
  }
}
