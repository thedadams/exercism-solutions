import simplifile.{Eexist,append,create_file, read}
import gleam/string.{split,trim}
import gleam/result.{map_error}

pub fn read_emails(path: String) -> Result(List(String), Nil) {
  case read(path) {
    Ok(contents) -> Ok(split(trim(contents), "\n"))
    _ -> Error(Nil)
  }
}

pub fn create_log_file(path: String) -> Result(Nil, Nil) {
  case create_file(path) {
    Ok(Nil) -> Ok(Nil)
    Error(Eexist) -> Ok(Nil)
    _ -> Error(Nil)
  }
}

pub fn log_sent_email(path: String, email: String) -> Result(Nil, Nil) {
    append(path, email <> "\n") |> map_error(fn(_e) { Nil })
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
  let assert Ok(Nil) = create_log_file(log_path)
  case read_emails(emails_path) {
    Ok(e) -> send_to_all(e, log_path, send_email)
    _ -> Error(Nil)
  }
}

fn send_to_all(emails: List(String), log_path: String, send_email: fn(String) -> Result(Nil, Nil)) -> Result(Nil, Nil) {
  case emails {
    [] -> Ok(Nil)
    [first, ..rest] -> {
      case send_email(first) {
        Ok(Nil) -> case log_sent_email(log_path, first) {
          Ok(Nil) -> send_to_all(rest, log_path, send_email)
          _ -> Error(Nil)
        }
        _ -> send_to_all(rest, log_path, send_email)
      }
    }
  }
}
