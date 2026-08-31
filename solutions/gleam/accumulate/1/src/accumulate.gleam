import gleam/list.{map}

pub fn accumulate(list: List(a), fun: fn(a) -> b) -> List(b) {
  map(list, fun)
}
