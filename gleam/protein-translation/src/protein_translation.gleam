import gleam/string
import gleam/list
import gleam/result

pub fn proteins(rna: String) -> Result(List(String), Nil) {
  let n = string.length(rna)
  case n == 0 {
    True -> Ok([])
    False -> {
      let q = n / 3
      let count = {
        case n % 3 == 0 {
          False -> q
          True -> q - 1
        }
      }
      list.range(0, count)
      |> list.map(fn(i) { string.slice(rna, i * 3, 3) })
      |> list.map(codon_protein)
      |> list.take_while(fn(protein) {
        case protein {
          Ok(p) -> p != "STOP"
          Error(_) -> True
        }
      })
      |> fn(valid_sequence) {
        case list.all(valid_sequence, result.is_ok) {
          True -> result.all(valid_sequence)
          False -> Error(Nil)
        }
      }
    }
  }
}

fn codon_protein(codon: String) {
  case codon {
    "AUG" -> Ok("Methionine")
    "UUU" | "UUC" -> Ok("Phenylalanine")
    "UUA" | "UUG" -> Ok("Leucine")
    "UCU" | "UCC" | "UCA" | "UCG" -> Ok("Serine")
    "UAU" | "UAC" -> Ok("Tyrosine")
    "UGU" | "UGC" -> Ok("Cysteine")
    "UGG" -> Ok("Tryptophan")
    "UAA" | "UAG" | "UGA" -> Ok("STOP")
    _ -> Error(Nil)
  }
}
