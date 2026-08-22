@external(erlang, "gb_trees", "empty")
pub fn empty() -> GbTree(k, v)

@external(erlang, "gb_trees", "insert")
fn gb_trees_insert(key: k, value: v, tree: GbTree(k, v)) -> GbTree(k, v)

@external(erlang, "gb_trees", "delete_any")
fn delete_any(key: k, tree: GbTree(k, v)) -> GbTree(k, v)

// Please define the GbTree type
pub type GbTree(k, t)

pub fn new_gb_tree() -> GbTree(k, v) {
  empty()
}

pub fn insert(tree: GbTree(k, v), key: k, value: v) -> GbTree(k, v) {
  gb_trees_insert(key, value, tree)
}

pub fn delete(tree: GbTree(k, v), key: k) -> GbTree(k, v) {
  delete_any(key, tree)
}
