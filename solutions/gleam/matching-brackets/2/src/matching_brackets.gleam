import gleam/list
import gleam/string

pub fn is_paired(value: String) -> Bool {
  track_paired(string.to_graphemes(value), [])
}

fn track_paired(value: List(String), stack: List(String)) -> Bool {
  case value, stack {
    [], _ -> list.is_empty(stack)
    ["(", ..rest], _ -> track_paired(rest, ["(", ..stack])
    ["[", ..rest], _ -> track_paired(rest, ["[", ..stack])
    ["{", ..rest], _ -> track_paired(rest, ["{", ..stack])
    [")", ..rest], ["(", ..remaining] | ["]", ..rest], ["[", ..remaining] | ["}", ..rest], ["{", ..remaining] -> track_paired(rest, remaining)
    [")", ..], _ | ["]", ..], _ | ["}", ..], _ -> False
    [_, ..rest], _ -> track_paired(rest, stack)
  }
}
