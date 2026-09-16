import gleam/list
import gleam/string

pub fn is_paired(value: String) -> Bool {
  track_paired(string.to_graphemes(value), [])
}

fn track_paired(value: List(String), stack: List(String)) -> Bool {
  case value {
    [] -> list.is_empty(stack)
    [first, ..rest] -> case first {
      "[" -> track_paired(rest, ["[", ..stack])
      "(" -> track_paired(rest, ["(", ..stack])
      "{" -> track_paired(rest, ["{", ..stack])
      "]" -> case stack {
        ["[", ..remaining] -> track_paired(rest, remaining)
        _ -> False
        }
      ")" -> case stack {
        ["(", ..remaining] -> track_paired(rest, remaining)
        _ -> False
      }
      "}" -> case stack {
        ["{", ..remaining] -> track_paired(rest, remaining)
        _ -> False
      }
      _ -> track_paired(rest, stack)
    }
  }
}
