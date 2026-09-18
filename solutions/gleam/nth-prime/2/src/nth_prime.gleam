pub fn prime(number: Int) -> Result(Int, Nil) {
  case number {
    n if n <= 0 -> Error(Nil)
    // 2 is the first prime
    n if n == 1 -> Ok(2)
    // Start at 3 and subtract one from the number because we would
    // have already found 2.
    _ -> Ok(prime_counter(3, number-1))
  }
}

fn prime_counter(number: Int, count: Int) -> Int {
  case is_prime(number), count == 1 {
    True, True -> number
    True, False -> prime_counter(number+2, count-1)
    _, _ -> prime_counter(number+2, count)
  }
}

fn is_prime(n: Int) -> Bool {
  compute_is_prime(n, 2)
}

fn compute_is_prime(n: Int, i: Int) -> Bool {
  case i * i > n, n % i == 0 {
    // If i * i > n, then n is prime because we would have already
    // found a divisor.
    True, _ -> True
    False, True -> False
    False, False -> compute_is_prime(n, i+1)
  }
}
