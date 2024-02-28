function foo(n) {
    if (n < 3) {
        return n
    }

    let n_1 = 2
    let n_2 = 1
    let n_3 = 0

    // for (let i = 3; i < n; i++) { // from n to 3
    for (let i = n; i >= 3; i--) { // from 3 to n
        let temp = n_1 + 2 * n_2 + 3 * n_3
        n_3 = n_2
        n_2 = n_1
        n_1 = temp
    }
    return n_1
}

console.log("0:", foo(0))
console.log("1:", foo(1))
console.log("2:", foo(2))
console.log("3:", foo(3))
console.log("4:", foo(4))
