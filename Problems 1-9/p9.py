"""
There exists exactly one Pythagorean triplet for which a + b + c = 1000.
    Find the product abc.
"""
from math import prod
import itertools
from numpy import unique
from time import perf_counter

unique(
    [
        prod([x, y, z])
        for (x, y) in itertools.product(range(1, 501), range(1, 501))
        for z in range(1, 501)
        if ((x**2 + y**2 == z**2) and (x + y + z == 1000))
    ]
)[0]


def main():
    t1 = perf_counter()
    print(
        unique(
            [
                prod([x, y, z])
                for (x, y) in itertools.product(range(1, 501), range(1, 501))
                for z in range(1, 501)
                if ((x**2 + y**2 == z**2) and (x + y + z == 1000))
            ]
        )[0]
    )
    t2 = perf_counter()
    return t2 - t1
