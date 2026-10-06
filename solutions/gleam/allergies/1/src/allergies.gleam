import gleam/int
import gleam/list

pub type Allergen {
  Eggs
  Peanuts
  Shellfish
  Strawberries
  Tomatoes
  Chocolate
  Pollen
  Cats
}

pub fn allergic_to(allergen: Allergen, score: Int) -> Bool {
  int.bitwise_and(case allergen {
    Eggs -> 1
    Peanuts -> 2
    Shellfish -> 4
    Strawberries -> 8
    Tomatoes -> 16
    Chocolate -> 32
    Pollen -> 64
    Cats -> 128
  }, score) > 0
}

pub fn list(score: Int) -> List(Allergen) {
  list_allergens(score, 1, [])
}

fn list_allergens(score: Int, current: Int, acc: List(Allergen)) -> List(Allergen) {
  case current > 128 {
    True -> list.reverse(acc)
    False -> case int.bitwise_and(score, current) > 0 {
      True -> list_allergens(score, current * 2, [score_to(current), ..acc])
      False -> list_allergens(score, current * 2, acc)
    }
  }
}

fn score_to(score: Int) -> Allergen {
  case score {
    1 -> Eggs
    2 -> Peanuts
    4 -> Shellfish
    8 -> Strawberries
    16 -> Tomatoes
    32 -> Chocolate
    64 -> Pollen
    128 -> Cats
    _ -> panic as "unreachable"
  }
}
