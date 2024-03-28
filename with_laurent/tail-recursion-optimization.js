// def plus(a, b):
//     if a == 0:
//         return b
//     return plus(a - 1, b + 1)

function plus(a, b) {
    if (a === 0) {
        return b
    }
    return plus(a - 1, b + 1)
}

// console.log(plus(4, 5))
plus(1000000, 0) // RangeError: Maximum call stack size exceeded
// => No tail recursion elimination in JS (with node interpreter)
// NB: apparently, some interpreters do perform tail-recursion elimination
