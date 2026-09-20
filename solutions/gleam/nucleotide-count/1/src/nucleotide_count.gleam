import gleam/dict.{type Dict, from_list, new, upsert}
import gleam/list
import gleam/option
import gleam/result
import gleam/string

pub fn nucleotide_count(dna: String) -> Result(Dict(String, Int), Nil) {
  dna
  |> string.to_graphemes
  |> list.fold_until(Ok(from_list([#("A", 0), #("C", 0), #("G", 0), #("T", 0)])), count_nucleotides)
}

fn count_nucleotides(acc: Result(Dict(String, Int), Nil), a: String) -> list.ContinueOrStop(Result(Dict(String, Int), Nil)) {
  case a {
    "A" | "C" | "G" | "T" -> list.Continue(Ok(upsert(result.unwrap(acc, new()), a, inc)))
    _ -> list.Stop(Error(Nil))
  }
}

fn inc(i: option.Option(Int)) -> Int {
  case i {
    option.Some(a) -> a + 1
    option.None -> 1
  }
}
