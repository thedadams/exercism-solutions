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
  let #(_, #(p0, p1)) = place
  case treasures {
    [] -> 0
    [t, ..rest] -> case t {
      #(_, #(t0, t1)) if t0 == p1 && t1 == p0 -> 1 
      _ -> 0
    } + count_place_treasures(place, rest)
  }
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  let #(found_name, _) = found_treasure
  let #(place_name, _) = place
  let #(desired_name, _) = desired_treasure

  case found_name, place_name, desired_name {
    "Brass Spyglass", "Abandoned Lighthouse", desired
      if desired != "Brass Spyglass" ->
      True
    "Amethyst Octopus", "Stormy Breakwater", "Crystal Crab" ->
      True
    "Amethyst Octopus", "Stormy Breakwater", "Glass Starfish" ->
      True
    "Vintage Pirate Hat", "Harbor Managers Office", "Model Ship in Large Bottle" ->
      True
    "Vintage Pirate Hat", "Harbor Managers Office", "Antique Glass Fishnet Float" ->
      True
    _, _, _ ->
      False
  }
}
