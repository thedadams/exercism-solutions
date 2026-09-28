import gleam/float
import gleam/int
import gleam/result

pub type Resistance {
  Resistance(unit: String, value: Int)
}

pub fn label(colors: List(String)) -> Result(Resistance, Nil) {
   case colors {
    [one, two, three, ..rest] -> case convert(one), convert(two), convert(three) {
      Ok(o), Ok(t), Ok(h) -> units(10 * o + t, int.power(10, int.to_float(h)))
      _, _, _ -> Error(Nil)
    }
    _ -> Error(Nil)
  }
}

fn convert(s: String) -> Result(Int, Nil) {
  case s {
    "black" -> Ok(0)
    "brown" -> Ok(1)
    "red" -> Ok(2)
    "orange" -> Ok(3)
    "yellow" -> Ok(4)
    "green" -> Ok(5)
    "blue" -> Ok(6)
    "violet" -> Ok(7)
    "grey" -> Ok(8)
    "white" -> Ok(9)
    _ -> Error(Nil)
  }
}

fn units(value: Int, unit: Result(Float, Nil)) -> Result(Resistance, Nil) {
  use u <- result.try(unit)
  case value * float.truncate(u) {
    a if a < 1000 -> Ok(Resistance("ohms", a))
    a if a < 1000000 -> Ok(Resistance("kiloohms", a / 1000))
    a if a < 1000000000 -> Ok(Resistance("megaohms", a / 1000000))
    _ -> Ok(Resistance("gigaohms", value))
  }
}
