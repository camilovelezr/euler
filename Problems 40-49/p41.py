import math
import sympy

nline = sympy.primerange(10**3, 10**8 - 1)

def removezeroes(x):
    if '0' in str(x):
        return False
    return True

nline = filter(removezeroes, nline)

def pandigital(x):
    d = str(x)
    s = set(d)
    l1 = len(d)
    l2 = len(s)
    if l1 == l2:
        c = [lambda y: y in s for y in range(1, l2+1)]
        if all(c):
            return True
        else:
            return False
    else:
        return False

print(max(filter(pandigital, nline)))



