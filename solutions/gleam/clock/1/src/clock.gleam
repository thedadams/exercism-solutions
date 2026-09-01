import gleam/int

pub type Clock {
  Clock(hour: Int, minutes: Int)
}

pub fn create(hour hour: Int, minute minute: Int) -> Clock {
  let hour = {{hour % 24} + 24} % 24
  case minute < 0 {
    True -> subtract(Clock(hour, 0), -minute)
    False -> add(Clock(hour, 0), minute)
  }
}

pub fn add(clock: Clock, minutes minutes: Int) -> Clock {
  let hour = {clock.hour + {minutes / 60}} % 24
  let minutes = {clock.minutes + {minutes % 60}}
  Clock({hour + {minutes / 60}} % 24, minutes % 60)
}

pub fn subtract(clock: Clock, minutes minutes: Int) -> Clock {
  let hour = {clock.hour - {minutes / 60}} % 24
  let minutes = {clock.minutes - {minutes % 60}}

  case minutes < 0 {
    True -> Clock({hour + 24 - 1} % 24, minutes + 60)
    False -> Clock({hour + 24} % 24, minutes)
  }
}

pub fn display(clock: Clock) -> String {
  let hour = case clock.hour < 10 {
    True -> "0"
    False -> ""
  } <> int.to_string(clock.hour)

  let min = case clock.minutes < 10 {
    True -> "0"
    False -> ""
  } <> int.to_string(clock.minutes)

  hour <> ":" <> min
}
