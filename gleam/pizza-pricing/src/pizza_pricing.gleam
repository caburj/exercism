import gleam/list

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  pizza_price_iter(pizza, 0)
}

fn pizza_price_iter(pizza, price) {
  case pizza {
    Margherita -> price + 7
    Caprese -> price + 9
    Formaggio -> price + 10
    ExtraSauce(p) -> pizza_price_iter(p, price + 1)
    ExtraToppings(p) -> pizza_price_iter(p, price + 2)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  list.fold(order, 0, fn(total, pizza) { total + pizza_price(pizza) })
  + case list.length(order) {
    1 -> 3
    2 -> 2
    _ -> 0
  }
}
