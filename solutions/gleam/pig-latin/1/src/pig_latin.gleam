import gleam/list
import gleam/result
import gleam/string

pub fn translate(phrase: String) -> String {
  phrase  
  |> string.split(" ")
  |> list.map(fn(a) { translate_word(a, "")})
  |> string.join(" ")
}

fn translate_word(w: String, consonants: String) -> String {
  case w {
    "a" <> _ | "e" <> _ | "i" <> _ | "o" <> _ | "u" <> _ | "xr" <> _ | "yt" <> _ -> w <> consonants <> "ay"
    "qu" <> rest -> rest <> consonants <> "quay"
    "y" <> rest -> case consonants {
      "" -> rest <> "yay"
      _ -> w <> consonants <> "ay"
    }
    _ -> translate_word(string.drop_start(w, 1), consonants <> result.unwrap(string.first(w), ""))
  }
}
