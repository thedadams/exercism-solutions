import gleam/list
import gleam/string

pub fn proteins(rna: String) -> Result(List(String), Nil) {
  proteins_acc(rna, [])
}

fn proteins_acc(rna: String, acc: List(String)) -> Result(List(String), Nil) {
  case string.slice(rna, 0, 3) {
    "" -> Ok(list.reverse(acc))
    "AUG" -> proteins_acc(string.drop_start(rna, 3), ["Methionine", ..acc])
    "UUU" | "UUC" -> proteins_acc(string.drop_start(rna, 3), ["Phenylalanine", ..acc])
    "UUA" | "UUG" -> proteins_acc(string.drop_start(rna, 3), ["Leucine", ..acc])
    "UCU" | "UCC" | "UCA" | "UCG" -> proteins_acc(string.drop_start(rna, 3), ["Serine", ..acc])
    "UAU" | "UAC" -> proteins_acc(string.drop_start(rna, 3), ["Tyrosine", ..acc])
    "UGU" | "UGC" -> proteins_acc(string.drop_start(rna, 3), ["Cysteine", ..acc])
    "UGG" -> proteins_acc(string.drop_start(rna, 3), ["Tryptophan", ..acc])
    "UAA" | "UAG" | "UGA" -> Ok(list.reverse(acc))
    _ -> Error(Nil)
  }
}
