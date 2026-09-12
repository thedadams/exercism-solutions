import gleam/set.{contains, from_list}
import gleam/list.{filter, map, sort}
import gleam/pair.{second}
import gleam/order
import gleam/int
import gleam/string

pub type School {
  School(students: List(#(Int, String)))
}

pub fn create() -> School {
  School([])
}

pub fn roster(school: School) -> List(String) {
  school.students
  |> sort(order_tuple)
  |> map(second)
}

fn order_tuple(one: #(Int, String), two: #(Int, String)) -> order.Order {
  case int.compare(one.0, two.0) {
    order.Lt -> order.Lt
    order.Gt -> order.Gt
    order.Eq -> string.compare(one.1, two.1)
  }
}

pub fn add(
  to school: School,
  student student: String,
  grade grade: Int,
) -> Result(School, Nil) {
  case contains(from_list(school.students |> map(second)), student) {
    True -> Error(Nil)
    False -> Ok(School([#(grade, student), ..school.students]))
  }
}

pub fn grade(school: School, desired_grade: Int) -> List(String) {
  school.students
  |> filter(fn(a) { a.0 == desired_grade })
  |> map(second)
  |> sort(string.compare)
}
