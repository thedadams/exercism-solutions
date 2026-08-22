use std::collections::HashSet;

pub fn find(sum: u32) -> HashSet<[u32; 3]> {
    let mut triplets = HashSet::new();
    for m in 1..sum {
        for k in 1..sum {
            if k * m * m >= sum / 2 {
                break
            }
            if sum % (2 * k * m) == 0 {
                let n: u32 = (sum - 2 * k * m * m) / (2 * k * m);
                if m * m > n * n {
                    let a: u32 = k * (m * m - n * n);
                    let b: u32 = 2 * k * m * n;
                    let c: u32 = k * (m * m + n * n);
                    if a + b + c == sum {
                        if a < b {
                            triplets.insert([a, b, c]);
                        } else {
                            triplets.insert([b, a, c]);
                        }
                    }
                }
            }
        }
    }

    triplets
}
