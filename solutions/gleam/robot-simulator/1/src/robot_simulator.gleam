pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction, position)
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  case instructions {
    "R" <> rest -> move(new_direction(True, direction), position, rest)
    "L" <> rest -> move(new_direction(False, direction), position, rest)
    "A" <> rest -> move(direction, advance(position, direction), rest)
    _ -> create(direction, position)
  }
}

fn new_direction(turn_right: Bool, direction: Direction) -> Direction {
    case turn_right, direction {
      True, North -> East
      True, East -> South
      True, South -> West
      True, West -> North
      False, North -> West
      False, West -> South
      False, South -> East
      False, East -> North
    }
}

fn advance(position: Position, direction: Direction) -> Position {
  case direction {
    North -> Position(position.x, position.y + 1)
    East -> Position(position.x + 1, position.y)
    South -> Position(position.x, position.y - 1)
    West -> Position(position.x - 1, position.y)
  }
}
