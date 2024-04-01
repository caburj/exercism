import gleam/list

pub fn proteins(rna: String) -> Result(List(String), Nil) {
  parse(rna, [])
}

fn parse(rna, acc) {
  case rna {
    "AUG" <> r -> parse(r, ["Methionine", ..acc])
    "UUU" <> r | "UUC" <> r -> parse(r, ["Phenylalanine", ..acc])
    "UUA" <> r | "UUG" <> r -> parse(r, ["Leucine", ..acc])
    "UCU" <> r | "UCC" <> r | "UCA" <> r | "UCG" <> r ->
      parse(r, ["Serine", ..acc])
    "UAU" <> r | "UAC" <> r -> parse(r, ["Tyrosine", ..acc])
    "UGU" <> r | "UGC" <> r -> parse(r, ["Cysteine", ..acc])
    "UGG" <> r -> parse(r, ["Tryptophan", ..acc])
    "" | "UAA" <> _ | "UAG" <> _ | "UGA" <> _ -> Ok(list.reverse(acc))
    _ -> Error(Nil)
  }
}
