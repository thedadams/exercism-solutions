import gleam/dict.{type Dict, fold, insert, new}
import gleam/list
import gleam/string.{lowercase}

pub fn transform(legacy: Dict(Int, List(String))) -> Dict(String, Int) {
  use acc, key, vals <- fold(legacy, new())
  use acc, s <- list.fold(vals, acc)
  insert(acc, lowercase(s), key)
}