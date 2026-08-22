import gleam/list

pub fn wines_of_color(wines: List(Wine), color: Color) -> List(Wine) {
  list.filter(wines, fn(w) {w.color == color})
}

pub fn wines_from_country(wines: List(Wine), country: String) -> List(Wine) {
  list.filter(wines, fn(w) {w.country == country})
}

// Please define the required labelled arguments for this function
pub fn filter(wines: List(Wine), color c: Color, country co: String) -> List(Wine) {
  wines
  |> wines_of_color(c)
  |> wines_from_country(co)
}

pub type Wine {
  Wine(name: String, year: Int, country: String, color: Color)
}

pub type Color {
  Red
  Rose
  White
}
