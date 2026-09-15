import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub fn largest_product(digits: String, span: Int) -> Result(Int, Nil) {
  case span {
    s if s < 0 -> Error(Nil)
    s if s == 0 -> Ok(1)
    _ -> largest_product_max(digits, span, 0)
  }
}

fn largest_product_max(digits: String, span: Int, max: Int) -> Result(Int, Nil) {
  case string.length(digits) {
    a if a < span -> Error(Nil)
    a if a == span -> compute_span(digits, span, max)
    _ -> compute_span(digits, span, max) 
        |> result.map(fn(m) {largest_product_max(string.drop_start(digits, 1), span, m)})
        |> result.flatten
  }
}

fn compute_span(digits: String, span: Int, max: Int) -> Result(Int, Nil) {
  string.slice(digits, 0, span)
  |> string.to_graphemes
  |> list.map(int.parse)
  |> result.all
  |> result.map(fn(l) {int.max(max, int.product(l))}) 
}