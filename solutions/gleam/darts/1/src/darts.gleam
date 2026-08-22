import gleam/float.{square_root}
import gleam/result.{unwrap}

pub fn score(x: Float, y: Float) -> Int {
  let d = distance(x, y)
  case d {
    _ if d <=. 1.0 -> 10
    _ if d <=. 5.0 -> 5
    _ if d <=. 10.0 -> 1
    _ -> 0
  }
}

fn distance(x: Float, y: Float) -> Float {
  x *. x +. y *. y |> square_root |> unwrap(0.0)
}