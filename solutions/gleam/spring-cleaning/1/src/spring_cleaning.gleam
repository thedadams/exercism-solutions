import gleam/string.{split_once}

pub fn extract_error(problem: Result(a, b)) -> b {
  let assert Error(val) = problem
  val
}

pub fn remove_team_prefix(team: String) -> String {
  let assert Ok(#(_, name)) = split_once(team, "Team ")
  name
}

pub fn split_region_and_team(combined: String) -> #(String, String) {
  let assert Ok(split) = split_once(combined, ",")
 #(split.0, remove_team_prefix(split.1))
}
