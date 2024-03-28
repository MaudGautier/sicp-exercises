def plus(a, b):
    if a == 0:
        return b
    return plus(a - 1, b + 1)


# print(plus(4, 5))
plus(1000000, 0)  # RecursionError: maximum recursion depth exceeded in comparison

# => No tail recursion elimination in Python.
# Also, explanation by Guido Van Rossum about this is here:
# https://neopythonic.blogspot.com/2009/04/tail-recursion-elimination.html
