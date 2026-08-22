import gleam/string

pub fn message(log_line: String) -> String {
  case log_line {
    "[INFO]: " <> msg -> msg
    "[WARNING]: " <> msg -> msg
    "[ERROR]: " <> msg -> msg
    _ -> ""
  }
|> string.trim
}

pub fn log_level(log_line: String) -> String {
  case string.split(log_line, "]:") {
    [first,..] -> case first {
      "[" <> level -> string.lowercase(level)
      _ -> ""
    }
    _ -> ""
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
