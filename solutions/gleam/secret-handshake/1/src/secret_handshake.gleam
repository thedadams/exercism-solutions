import gleam/list
import gleam/int
import gleam/string

pub type Command {
  Wink
  DoubleBlink
  CloseYourEyes
  Jump
}

pub fn commands(encoded_message: Int) -> List(Command) {
  encoded_message
  |> int.to_base2
  |> string.to_graphemes
  |> list.reverse
  |> list.take(4)
  |> list.zip([Wink, DoubleBlink, CloseYourEyes, Jump])
  |> list.fold([], map)
  |> reverse_if_needed(int.bitwise_and(encoded_message, 16))
}

fn map(acc: List(Command), a: #(String, Command)) -> List(Command) {
  case a {
    #("1", c) -> [c, ..acc]
    _ -> acc
  }
}

fn reverse_if_needed(acc: List(a), bit: Int) -> List(a) {
  case bit {
    0 -> list.reverse(acc)
    _ -> acc
  }
}
