import gleam/result

pub fn to_rna(dna: String) -> Result(String, Nil) {
  case dna {
    "G" <> rest -> result.map(to_rna(rest), fn(a) {"C" <> a})
    "C" <> rest -> result.map(to_rna(rest), fn(a) {"G" <> a})
    "T" <> rest -> result.map(to_rna(rest), fn(a) {"A" <> a})
    "A" <> rest -> result.map(to_rna(rest), fn(a) {"U" <> a})
    "" -> Ok("")
    _ -> Error(Nil)
  }
}
