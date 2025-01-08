from sys import argv
from random import randint

ltrs = list("TRWAGMYFPDXBNJZSQVHLCKE")

def getnum(ltr=None):
    if ltr:
        num = getnum()
        ltr = getltr(num)
        while ltr not in ltrs:
            num = getnum()
            ltr = getltr(ltr)
        return num
    return randint(0, 10**8 - 1)

def getltr(num: int):
    return ltrs[num % len(ltrs)]

if len(argv) == 1:
    num = getnum()
    ltr = getltr(num)
else:
    try:
        num = int(argv[1])
        if num not in range(0, 10**8):
            raise Exception
        ltr = getltr(num)
    except Exception:
        try:
            ltr = chr(ord(argv[1])).upper()
            if ltr not in ltrs:
                raise Exception
            num = getnum(ltr)
        except Exception:
            print("Argument error.")
            exit(1)

print(f"{num:08d}{ltr}")
