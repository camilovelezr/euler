import itertools
import math


def ddo():
    s = 10
    c = 0
    d = {}
    for num in itertools.count(10):
        if c == 10**6:
            break
        for n in str(num):
            if c == 10**6:
                break
            d[s + c] = int(n)
            c += 1
    return d


def main():
    d = ddo()
    return math.prod(
        [1, d[10], d[10**2], d[10**3], d[10**4], d[10**5], d[10**6]]
    )
