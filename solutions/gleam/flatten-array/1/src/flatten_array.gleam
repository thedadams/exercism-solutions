import gleam/list

pub type NestedList(a) {
  Null
  Value(a)
  List(List(NestedList(a)))
}

pub fn flatten(nested_list: NestedList(a)) -> List(a) {
  list.reverse(flatten_nested(nested_list, []))
}

fn flatten_nested(list: NestedList(a), acc: List(a)) -> List(a) {
  case list {
    Null -> acc
    Value(v) -> [v, ..acc]
    List(l) -> list.append(flatten_list_nested(l, []), acc)
  }
}

fn flatten_list_nested(list: List(NestedList(a)), acc: List(a)) -> List(a) {
  case list {
    [] -> acc
    [first, ..rest] -> flatten_list_nested(rest, list.append(flatten_nested(first, []), acc))
  }
}