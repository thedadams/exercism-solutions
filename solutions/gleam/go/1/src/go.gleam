import gleam/result

pub type Player {
  Black
  White
}

pub type Game {
  Game(
    white_captured_stones: Int,
    black_captured_stones: Int,
    player: Player,
    error: String,
  )
}

pub fn apply_rules(
  game: Game,
  rule1: fn(Game) -> Result(Game, String),
  rule2: fn(Game) -> Game,
  rule3: fn(Game) -> Result(Game, String),
  rule4: fn(Game) -> Result(Game, String),
) -> Game {
  case case rule1(game) {
    Ok(g) -> Ok(rule2(g))
    Error(s) -> Error(s)
  }
  |> result.try(rule3)
  |> result.try(rule4) {
    Ok(g) -> case g.player {
      White -> Game(..g, player: Black)
      Black -> Game(..g, player: White)
    }
    Error(s) -> Game(..game, error: s)
  }
}
