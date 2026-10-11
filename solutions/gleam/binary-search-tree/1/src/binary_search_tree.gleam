import gleam/list

pub type Tree {
  Nil
  Node(data: Int, left: Tree, right: Tree)
}

pub fn to_tree(data: List(Int)) -> Tree {
  list.fold(data, Nil, insert)
}

fn insert(tree: Tree, value: Int) -> Tree {
  case tree {
    Nil -> Node(value, Nil, Nil)

    Node(data, left, right) ->
      case value <= data {
        True -> Node(data, insert(left, value), right)
        False -> Node(data, left, insert(right, value))
      }
  }
}

pub fn sorted_data(data: List(Int)) -> List(Int) {
  data
  |> to_tree
  |> in_order([])
}

fn in_order(t: Tree, acc: List(Int)) -> List(Int) {
  case t {
    Nil -> acc
    Node(data, left, right) -> in_order(left, [data, ..in_order(right, acc)])
  }
}