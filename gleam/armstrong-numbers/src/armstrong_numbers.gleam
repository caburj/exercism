import gleam/list
import gleam/int

pub fn is_armstrong_number(number: Int) -> Bool {
  let assert Ok(digits) = int.digits(number, 10)
  let c = list.length(digits)
  number == sum(digits, fn(d) { int_power(d, c) })
}

fn int_power(base, exponent) {
  case exponent {
    0 -> 1
    _ -> base * int_power(base, exponent - 1)
  }
}

fn sum(l, f) {
  list.fold(l, 0, fn(a, x) { a + f(x) })
}
