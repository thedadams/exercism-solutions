import gleam/order.{type Order}
import gleam/float
import gleam/list

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  {f -. 32.0} *. 5.0 /. 9.0
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  let temp1 = case left {
    Celsius(t) -> t
    Fahrenheit(t) -> fahrenheit_to_celsius(t)
  }
  let temp2 = case right {
    Celsius(t) -> t
    Fahrenheit(t) -> fahrenheit_to_celsius(t)
  }

  float.compare(temp1, temp2)
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  list.sort(cities, compare_cities)
}

fn compare_cities(left: City, right: City) -> Order {
  compare_temperature(left.temperature, right.temperature)
}
