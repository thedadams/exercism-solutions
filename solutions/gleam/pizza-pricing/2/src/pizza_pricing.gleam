pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}


pub fn pizza_price(pizza: Pizza) -> Int {
  price(pizza, 0)
}

fn price(pizza: Pizza, total: Int) -> Int {
  case pizza {
    ExtraSauce(p) -> price(p, total + 1)
    ExtraToppings(p) -> price(p, total + 2)
    Margherita -> 7 + total
    Caprese -> 9 + total
    Formaggio -> 10 + total
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  total_price(order, 0, 0)
}

fn total_price(order: List(Pizza), total: Int, count: Int) -> Int {
  case order {
    [] -> total + case count {
      1 -> 3
      2 -> 2
      _ -> 0
    }
    [first, ..rest] -> total_price(rest, total + pizza_price(first), count + 1)
  }
}
