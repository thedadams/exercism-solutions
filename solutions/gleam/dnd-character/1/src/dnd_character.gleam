import gleam/int
import gleam/list

pub type Character {
  Character(
    charisma: Int,
    constitution: Int,
    dexterity: Int,
    hitpoints: Int,
    intelligence: Int,
    strength: Int,
    wisdom: Int,
  )
}

pub fn generate_character() -> Character {
  let c = ability()
  Character(ability(), c, ability(), 10 + modifier(c), ability(), ability(), ability())
}

pub fn modifier(score: Int) -> Int {
  case int.floor_divide(score - 10, 2) {
    Ok(c) -> c
    _ -> panic as "unreachable"
  }
}

pub fn ability() -> Int {
  [roll_dice(), roll_dice(), roll_dice(), roll_dice()]
  |> list.fold(#(7, 0), fn(acc, a) { #(int.min(acc.0, a), acc.1 + a)})
  |> fn(acc) { acc.1 - acc.0}
}

fn roll_dice() -> Int {
  int.random(6) + 1
}
