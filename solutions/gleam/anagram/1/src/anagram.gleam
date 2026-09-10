import gleam/dict
import gleam/list
import gleam/string
import gleam/option

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  let letters = letter_dict(word)

  use w <- list.filter(candidates)
  include_word(w, word, letters)
}

fn letter_dict(word: String) -> dict.Dict(String, Int) {
  string.lowercase(word)
  |> string.to_graphemes
  |> list.fold(dict.new(), letter_counts)
}

fn dicts_match(one: dict.Dict(String, Int), two: dict.Dict(String, Int)) -> Bool {
  dict.size(one) == dict.size(two) && dict.size(dict.filter(one, fn(k, v) {
    dict.get(two, k) != Ok(v)
  })) == 0
}

fn include_word(word: String, to_match: String, to_match_letters: dict.Dict(String, Int)) -> Bool {
  string.lowercase(word) != string.lowercase(to_match) && dicts_match(to_match_letters, letter_dict(word))
}

fn letter_counts(acc: dict.Dict(String, Int), letter: String) -> dict.Dict(String, Int) {
  dict.upsert(acc, letter, increment)
}

fn increment(x: option.Option(Int)) -> Int {
  case x {
    option.Some(i) -> i + 1
    option.None -> 1
  }
}