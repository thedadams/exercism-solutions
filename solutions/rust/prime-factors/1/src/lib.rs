pub fn factors(n: u64) -> Vec<u64> {
    let mut factors = Vec::new();
    let mut num = n;
    let mut num_factors: usize = usize::MAX;
    while num > 1 && factors.len() != num_factors {
        num_factors = factors.len();
        for i in 2..(num as f64).sqrt() as u64 + 1 {
            if num % i == 0 {
                factors.push(i);
                num /= i;
                break;
            }
        }
    }

    if num > 1 {
        factors.push(num);
    }
    factors
}
