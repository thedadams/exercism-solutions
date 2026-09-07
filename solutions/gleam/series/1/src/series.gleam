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
      _ -> Ok(series(graphs, size, len - size, []))
    }
    False -> Error(EmptySeries)
  }
}

fn series(input: List(String), size: Int, count: Int, acc: List(String)) -> List(String) {
  case count {
    -1 -> list.reverse(acc)
    _ -> input
        |> list.rest
        |> result.unwrap([])
        |> series(size, count - 1, [string.join(list.take(input, size), ""), ..acc])
  }
}

pub type Error {
  SliceLengthTooLarge
  SliceLengthZero
  SliceLengthNegative
  EmptySeries
}
