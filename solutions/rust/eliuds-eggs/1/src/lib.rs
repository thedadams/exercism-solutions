pub fn egg_count(display_value: u32) -> usize {
    let mut val: usize = display_value.try_into().unwrap();
    let mut count: usize = 0;
    while val > 0 {
        count += val % 2;
        val /= 2
    }

    count
}
