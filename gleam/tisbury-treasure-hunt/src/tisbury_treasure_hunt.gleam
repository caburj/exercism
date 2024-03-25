import gleam/list.{filter, length}

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  #(place_location.1, place_location.0)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  place_location_to_treasure_location(place_location) == treasure_location
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  treasures
  |> filter(fn(treasure) {
    treasure_location_matches_place_location(place.1, treasure.1)
  })
  |> length
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  let ft = found_treasure.1
  let dt = desired_treasure.1
  let p = place.1
  case #(ft.0, ft.1, p.0, p.1, dt.0, dt.1) {
    #(4, "B", "B", 4, _, _) -> True
    #(1, "F", "B", 5, 6, "A") -> True
    #(1, "F", "B", 5, 6, "D") -> True
    #(7, "E", "A", 8, 8, "A") -> True
    #(7, "E", "A", 8, 3, "D") -> True
    _ -> False
  }
}
