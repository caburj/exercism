import gleam/list.{all, append, filter, filter_map, fold, length, map}
import gleam/int.{min, to_float}

pub fn lowest_price(books: List(Int)) -> Float {
  let groups = get_groups(books)
  let base_total =
    fold(groups, 0.0, fn(a, n) {
      a
      +. {
        case n {
          1 -> 800.0
          2 -> 800.0 *. 2.0 *. 0.95
          3 -> 800.0 *. 3.0 *. 0.9
          4 -> 800.0 *. 4.0 *. 0.8
          5 -> 800.0 *. 5.0 *. 0.75
          _ -> panic
        }
      }
    })

  // groups of 3 and 5 should be changed to 2 groups of 4
  // As a result, the total price can be reduced by 40 for each conversion
  let count_3 = length(filter(groups, fn(y) { y == 3 }))
  let count_5 = length(filter(groups, fn(y) { y == 5 }))
  let adjustment = 40.0 *. to_float(min(count_3, count_5))

  base_total -. adjustment
}

fn get_groups(books) {
  let init_counts = [#(1, 0), #(2, 0), #(3, 0), #(4, 0), #(5, 0)]
  let book_counts =
    fold(books, init_counts, fn(counts, book) {
      map(counts, fn(x) {
        let #(k, v) = x
        case k == book {
          True -> #(k, v + 1)
          False -> #(k, v)
        }
      })
    })
  get_groups_iter(book_counts, [])
}

fn get_groups_iter(counts, result) {
  case
    all(counts, fn(x) {
      let #(_, v) = x
      v == 0
    })
  {
    True -> result
    False -> {
      let books_to_take =
        filter_map(counts, fn(x) {
          let #(k, v) = x
          case v > 0 {
            True -> Ok(k)
            False -> Error(Nil)
          }
        })
      get_groups_iter(
        fold(books_to_take, counts, fn(counts, book) {
          map(counts, fn(x) {
            let #(k, v) = x
            case k == book && v > 0 {
              True -> #(k, v - 1)
              False -> #(k, v)
            }
          })
        }),
        append(result, [length(books_to_take)]),
      )
    }
  }
}
