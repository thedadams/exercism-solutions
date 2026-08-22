extern crate unicode_segmentation;
use unicode_segmentation::UnicodeSegmentation;
pub fn reverse(input: &str) -> String {
    println!("{}", input.len());
    input.graphemes(true).rev().collect()
}
