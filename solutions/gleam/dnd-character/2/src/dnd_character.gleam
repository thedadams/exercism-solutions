import gleam/int

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
  let assert Ok(c) = int.floor_divide(score - 10, 2) 
  c
}

pub fn ability() -> Int {
  int.random(16) + 3
}
