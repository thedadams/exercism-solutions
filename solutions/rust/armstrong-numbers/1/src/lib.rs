pub fn is_armstrong_number(num: u32) -> bool {
    let mut digits = Vec::new();
    let mut n = num;
    while n > 0 {
        digits.push(n % 10);
        n /= 10;
    }

    let p = digits.len();
    let mut ans: u32 = 0;
    for n in digits.iter() {
        ans += n.pow(p.try_into().unwrap());
    }

    return ans == num;
}
