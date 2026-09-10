import gleam/list

pub fn keep(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  apply_predicate(list, predicate, True, [])
}

fn apply_predicate(list: List(t), predicate: fn(t) -> Bool, predicate_matches: Bool, acc: List(t)) -> List(t) {
  case list {
    [] -> list.reverse(acc)
    [first, ..rest] -> case predicate(first) == predicate_matches {
      True -> apply_predicate(rest, predicate, predicate_matches, [first, ..acc])
      False -> apply_predicate(rest, predicate, predicate_matches, acc)
    }
  }
}

pub fn discard(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  apply_predicate(list, predicate, False, [])
}
