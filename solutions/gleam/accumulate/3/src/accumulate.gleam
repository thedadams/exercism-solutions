import gleam/list.{reverse}

pub fn accumulate(list: List(a), fun: fn(a) -> b) -> List(b) {
  acc(list, fun, [])
}

fn acc(list: List(a), fun: fn(a) -> b, res: List(b)) -> List(b) {
  case list {
    [] -> reverse(res)
    [first, ..rest] -> acc(rest, fun, [fun(first), ..res])
  }
}
