import gleam/set.{type Set, from_list, insert, contains, delete, to_list, intersection, size, union, filter}
import gleam/list
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
   from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  #(contains(collection, card), insert(collection, card))
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  #(contains(collection, my_card) && !contains(collection, their_card), delete(collection, my_card) |> insert(their_card))
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  case collections {
    [] -> []
    [one] -> list.sort(to_list(one), string.compare)
   [first, ..rest] -> list.sort(to_list(intersection(first, from_list(boring_cards(rest)))), string.compare)
  }
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  unions(collections)
  |> size
}

fn unions(collections: List(Set(String))) -> Set(String) {
  case collections {
    [] -> from_list([])
    [one] -> one
    [first, ..rest] -> union(first, unions(rest))
  }
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  let is_shiny = fn(s) { string.starts_with(s, "Shiny ")}
  filter(collection, is_shiny)
}
