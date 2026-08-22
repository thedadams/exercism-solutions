import gleam/option.{type Option, Some, None}
import gleam/int.{max}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    Some(name) -> name
    None -> "Mighty Magician"
  }
}

pub fn revive(player: Player) -> Option(Player) {
  case player {
    Player(health: h, ..) if h > 0 -> None
    Player(level: l, ..) if l >= 10 -> Some(Player(..player, health: 100, mana: Some(100)))
    _ -> Some(Player(..player, health: 100))
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  let Player(mana: m, ..) = player
  case m {
    None -> #(Player(..player, health: max(0, player.health - cost)), 0)
    Some(m) -> case m > cost {
      True -> #(Player(..player, mana: Some(m - cost)), 2 * cost)
      False -> #(player, 0)
    }
  }
}
