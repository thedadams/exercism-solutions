import gleam/dict.{type Dict, fold, from_list, insert}
import gleam/string.{lowercase}

pub fn transform(legacy: Dict(Int, List(String))) -> Dict(String, Int) {
  fold(legacy, from_list([]), map)
}

fn map(acc: Dict(String, Int), key: Int, vals: List(String)) -> Dict(String, Int) {
  case vals {
    [] -> acc
    [first, ..rest] -> {
      insert(acc, lowercase(first), key)
      |> map(key, rest)
    }
  }
}