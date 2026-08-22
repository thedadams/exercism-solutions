pub fn verse(n: u32) -> String {
    if n > 0 {
        format!("{} bottle{} of beer on the wall, {} bottle{} of beer.\nTake one down and pass it around, {} bottle{} of beer on the wall.", n,if n == 1 {""} else {"s"}, n,if n == 1 {""} else {"s"}, if n - 1 == 0 {String::from("no more")} else {format!("{}", n-1)}, if n-1 == 1 {""} else {"s"})
    } else {
        format!("No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.")
    }
}

pub fn sing(start: u32, end: u32) -> String {
    let mut song = String::new();
    for idx in start..=end {
        song.push_str(&verse(idx));
    }

    song
}
