import gleam/order.{type Order}
import gleam/list

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. 32.0 } /. 1.8
}

fn celcius(t: Temperature) -> Float {
  case t {
    Celsius(c) -> c
    Fahrenheit(f) -> fahrenheit_to_celsius(f)
  }
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  case { celcius(left) -. celcius(right) } {
    x if x <. 0.0 -> order.Lt
    x if x >. 0.0 -> order.Gt
    _ -> order.Eq
  }
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  use c1, c2 <- list.sort(cities)
  compare_temperature(c1.temperature, c2.temperature)
}
