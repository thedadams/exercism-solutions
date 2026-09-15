import gleam/list
import gleam/string

pub type Student {
  Alice
  Bob
  Charlie
  David
  Eve
  Fred
  Ginny
  Harriet
  Ileana
  Joseph
  Kincaid
  Larry
}

pub type Plant {
  Radishes
  Clover
  Violets
  Grass
}

pub fn plants(diagram: String, student: Student) -> List(Plant) {
  case student {
    Alice -> cherry_pick(diagram, 0)
    Bob -> cherry_pick(diagram, 2)
    Charlie -> cherry_pick(diagram, 4)
    David -> cherry_pick(diagram, 6)
    Eve -> cherry_pick(diagram, 8)
    Fred -> cherry_pick(diagram, 10)
    Ginny -> cherry_pick(diagram, 12)
    Harriet -> cherry_pick(diagram, 14)
    Ileana -> cherry_pick(diagram, 16)
    Joseph -> cherry_pick(diagram, 18)
    Kincaid -> cherry_pick(diagram, 20)
    Larry -> cherry_pick(diagram, 22)
  }
}

fn cherry_pick(diagram: String, start: Int) -> List(Plant) {
  diagram
  |> string.split("\n")
  |> list.map(fn(a) {string.to_graphemes(string.slice(a, start, 2))})
  |> list.flatten
  |> list.map(to_plant)
}

fn to_plant(s: String) -> Plant {
  case s {
    "R" -> Radishes
    "C" -> Clover
    "V" -> Violets
    "G" -> Grass
    _ -> panic as "invalid plant letter"
  }
}