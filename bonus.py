import itertools
import timeit

def ps():
    n = itertools.count(100)
    def isit(x):
        if (((sum(int(d) for d in str(x))))**3 == x):
            return False
        else:
            return True
    return list(itertools.islice(itertools.dropwhile(isit, n), 1))

print(f"{(timeit.timeit(ps, number=1000)/1000)*(10**6)} microseconds")

"""
i7
290.39572598412633 microseconds
"""