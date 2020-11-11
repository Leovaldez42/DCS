import math
n = int(input("Enter n: "))
ls = []

for i in range(n):
    print("Enter vector: ",end="")
    ls.append([int(x) for x in input().split()])
    print()

coeffs = []
for i in range(1, 2**n):
    coeffs.append((format(i,'b').zfill(n)))

flag = 0
for i in coeffs:
    s = 0
    for j in range(n):
        s += int(i[j]) * int(ls[j][0])
    ans = ""
    for j in range(0, len(str(s))):
        ans = ans + str(int(str(s)[j]) % 2)
    if ans == "0000":
        flag = 1
        break
if flag == 1:
    print("Set of vectors is Linearly Dependent")
else:
    print("Set of vectors is Linearly independent")