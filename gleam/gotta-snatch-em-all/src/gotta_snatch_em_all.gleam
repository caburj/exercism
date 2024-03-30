import gleam/set.{type Set}
import gleam/list
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  case set.contains(collection, card) {
    True -> #(True, collection)
    False -> #(False, set.insert(collection, card))
  }
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let have_card = set.contains(collection, my_card)
  let already_owned = set.contains(collection, their_card)
  #(
    have_card && !already_owned,
    collection
      |> set.delete(my_card)
      |> set.insert(their_card),
  )
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  case collections {
    [] -> []
    [first, ..rest] -> {
      list.fold(rest, first, set.intersection)
      |> set.to_list
    }
  }
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  collections
  |> list.fold(set.new(), set.union)
  |> set.size
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  use card <- set.filter(collection)
  string.starts_with(card, "Shiny ")
}
