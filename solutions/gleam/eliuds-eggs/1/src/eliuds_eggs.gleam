pub fn egg_count(number: Int) -> Int {
  egg_count_acc(number, 0)
}

fn egg_count_acc(number: Int, acc: Int) -> Int {
  case number {
    0 -> acc
    _ -> egg_count_acc(number / 2, acc + {number % 2})
  }
}
