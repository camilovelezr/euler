import time


def main():
    t1 = time.perf_counter()
    r = abs(sum(range(1, 101)) ** 2 - sum(map(lambda x: x**2, range(1, 101))))
    t2 = time.perf_counter()
    return r, t2 - t1
