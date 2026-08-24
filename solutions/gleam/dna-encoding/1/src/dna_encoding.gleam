pub type Nucleotide {
  Adenine
  Cytosine
  Guanine
  Thymine
}

pub fn encode_nucleotide(nucleotide: Nucleotide) -> Int {
  case nucleotide {
    Adenine -> 0b00
    Cytosine -> 0b01
    Guanine -> 0b10
    Thymine -> 0b11
  }
}

pub fn decode_nucleotide(nucleotide: Int) -> Result(Nucleotide, Nil) {
  case nucleotide {
    0 -> Ok(Adenine)
    1 -> Ok(Cytosine)
    2 -> Ok(Guanine)
    3 -> Ok(Thymine)
    _ -> Error(Nil)
  }
}

pub fn encode(dna: List(Nucleotide)) -> BitArray {
  case dna {
    [] -> <<>>
    [first, ..rest] -> <<encode_nucleotide(first):size(2), encode(rest):bits>>
  }
}

pub fn decode(dna: BitArray) -> Result(List(Nucleotide), Nil) {
  case dna {
    <<>> -> Ok([])
    <<first:2, rest:bits>> -> case decode_nucleotide(first), decode(rest) {
      Ok(f), Ok(r) -> Ok([f, ..r])
      _, _ -> Error(Nil)
    }
    _ -> Error(Nil)
  }
}
