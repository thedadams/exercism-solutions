// TODO: import the `gleam/int` module
// TODO: import the `gleam/float` module
// TODO: import the `gleam/string` module
import gleam/int
import gleam/float

pub fn pence_to_pounds(pence) {
  int.to_float(pence) /. 100.0
}

pub fn pounds_to_string(pounds) {
  "£" <> float.to_string(float.to_precision(pounds, 2))
}
