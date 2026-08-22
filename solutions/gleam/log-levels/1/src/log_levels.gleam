import gleam/string

pub fn message(log_line: String) -> String {
  case log_line {
    "[INFO]: " <> msg -> string.trim(msg)
    "[WARNING]: " <> msg -> string.trim(msg)
    "[ERROR]: " <> msg -> string.trim(msg)
    _ -> ""
  }
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
  case log_line {
    "[INFO]: " <> msg -> string.trim(msg) <> " (info)"
    "[WARNING]: " <> msg -> string.trim(msg) <> " (warning)"
    "[ERROR]: " <> msg -> string.trim(msg) <> " (error)"
    _ -> ""
  }
}
