import gleam/string
import gleam/list
import gleam/result

pub fn slices(input: String, size: Int) -> Result(List(String), Error) {
  let graphs = string.to_graphemes(input)
  let len = list.length(graphs)
  case len > 0 {
    True -> case size {
      s if s < 0 -> Error(SliceLengthNegative)
      s if s == 0 -> Error(SliceLengthZero)
      s if s > len -> Error(SliceLengthTooLarge)
      _ -> Ok(series(graphs, size))
    }
    False -> Error(EmptySeries)
  }
}

fn series(input: List(String), size: Int) -> List(String) {
  input
  |> list.window(size)
  |> list.map(string.concat)
}

pub type Error {
  SliceLengthTooLarge
  SliceLengthZero
  SliceLengthNegative
  EmptySeries
}
