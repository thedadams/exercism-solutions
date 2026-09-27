import gleam/int

pub type Position {
  Position(row: Int, column: Int)
}

pub type Error {
  RowTooSmall
  RowTooLarge
  ColumnTooSmall
  ColumnTooLarge
}

pub fn create(queen: Position) -> Result(Nil, Error) {
  case queen.row, queen.column {
    n, _ if n < 0 -> Error(RowTooSmall)
    n, _ if n > 7 -> Error(RowTooLarge)
    _, n if n < 0 -> Error(ColumnTooSmall)
    _, n if n > 7 -> Error(ColumnTooLarge)
    _, _ -> Ok(Nil)
  }
}

pub fn can_attack(
  black_queen black_queen: Position,
  white_queen white_queen: Position,
) -> Bool {
  case create(black_queen), create(white_queen) {
    Ok(Nil), Ok(Nil) -> black_queen.row == white_queen.row || black_queen.column == white_queen.column || int.absolute_value({black_queen.row - white_queen.row} / {black_queen.column - white_queen.column}) == 1
    _, _ -> False
  }
}
