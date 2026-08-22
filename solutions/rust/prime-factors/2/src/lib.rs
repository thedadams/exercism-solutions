pub fn factors(mut n: u64) -> Vec<u64> {
    let mut factors = Vec::new();
    let mut num_factors: usize = usize::MAX;
    while n > 1 && factors.len() != num_factors {
        num_factors = factors.len();
        for i in 2..(n as f64).sqrt() as u64 + 1 {
            if n % i == 0 {
                factors.push(i);
                n /= i;
                break;
            }
        }
    }

    if n > 1 {
        factors.push(n);
    }
    factors
}
