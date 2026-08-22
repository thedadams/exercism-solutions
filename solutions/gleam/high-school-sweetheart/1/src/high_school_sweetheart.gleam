import gleam/string

pub fn first_letter(name: String) {
  case string.trim(name) |> string.first {
    Ok(c) -> c
    _ -> ""
  }
}

pub fn initial(name: String) {
  first_letter(name)
  |> string.uppercase
  |> string.append(".")
}

pub fn initials(full_name: String) {
  let #(first, last) = case string.split_once(string.replace(full_name, "\n", " "), " ") {
    Ok(fl) -> fl
    _ -> #("", "")
  }

  initial(first) <> " " <> initial(last)
}

pub fn pair(full_name1: String, full_name2: String) {
"
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     " <> initials(full_name1) <> "  +  " <> initials(full_name2) <> "     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
}
