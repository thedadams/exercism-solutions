import gleam/list
import gleam/int
import gleam/result
import gleam/string

pub fn row(index: Int, string: String) -> Result(List(Int), Nil) {
  string
  |> string.split("\n")
  |> list.drop(index - 1)
  |> list.first
  |> result.try(fn(a) { Ok(string.split(a, " ")) })
  |> result.map(fn(a) { list.map(a, int.parse ) })
  |> result.try(result.all)
}

pub fn column(index: Int, string: String) -> Result(List(Int), Nil) {
  string
  |> string.split("\n")
  |> list.map(fn (a) { string.split(a, " ") })
  |> list.map(fn(a) { list.drop(a, index - 1) })
  |> list.map(list.first)
  |> result.all
  |> result.map(fn(a) { list.map(a, int.parse ) })
  |> result.try(result.all)
}
