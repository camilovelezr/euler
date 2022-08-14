extern crate digits_iterator;
use digits_iterator::*;

fn main(){
    let mut counter = 0;
    let mut prod = 1;
    let arr = [1, 10, 100, 1000, 10000, 100000, 1000000];
    // const RADIX: u32 = 10;
    while counter <= 1000000{
        for n in 1..1000000{
            for digit in n.to_string().chars() {
                counter = counter + 1;
                if arr.contains(digit.into()){
                    prod = prod * digit.into();
                }
            }
        }
    }
    println!("{}", prod)
}