pub fn today(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [x, ..] -> x
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [] -> [1]
    [x, ..others] -> [x + 1, ..others]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case days {
    [] -> False
    [x, ..others] -> x == 0 || has_day_without_birds(others)
  }
}

pub fn total(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [x, ..others] -> x + total(others)
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [x, ..others] -> {
      case x > 4 {
        True -> 1 + busy_days(others)
        False -> busy_days(others)
      }
    }
  }
}
