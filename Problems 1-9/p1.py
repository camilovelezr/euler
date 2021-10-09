import itertools

def p1():
    n = itertools.count(3)
    t = itertools.takewhile(lambda x: x<(1000), n)
    def _t(x):
        if (x%3==0) or (x%5==0):
            return False
        else:
            return True
    return sum(itertools.filterfalse(lambda x: _t(x), t))

#import timeit

#t = timeit.Timer(p1).timeit(number = 1000)
#print(f"{t/1000} seconds or {(t/1000)*10**6} microseconds vs {1.850*10**-6:.10f} seconds or {1.85} microseconds in Julia")

"""
M1
0.00020026333300006627 seconds or 200.26333300006627 microseconds vs 0.0000018500 seconds or 1.85 microseconds in Julia
"""