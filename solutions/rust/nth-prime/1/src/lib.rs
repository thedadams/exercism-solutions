pub fn nth(mut n: u32) -> u32 {
    let mut last_prime = 2;
    while n > 0 {
        last_prime = next_prime(last_prime);

        n -= 1;
    }

    last_prime
}

fn next_prime(mut start: u32) -> u32 {
    start += 1;
    while !is_prime(start) {
        start += 1;
    }

    start
}

fn is_prime(num: u32) -> bool {
    for i in 2..((num as f64).sqrt() as u32 + 1) {
        if num % i == 0 {
            return false;
        }
    }

    return true;
}
