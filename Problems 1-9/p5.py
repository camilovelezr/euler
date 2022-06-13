"""
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
"""
import itertools
import time


def _divisible(x: int, y: int) -> bool:
    return (y / x).is_integer()


def divisible(x: range, y: int) -> bool:
    return all(map(lambda i: _divisible(i, y), x))


def main() -> int:
    return list(
        itertools.islice(
            itertools.dropwhile(
                lambda x: not (divisible(range(1, 21), x)), itertools.count(1)
            ),
            1,
        )
    )[0]


def timeit():
    t1 = time.perf_counter()
    print(main())
    t2 = time.perf_counter()
    return t2 - t1


"""
>>> timeit()
232792560
123.08954441700007
"""
