import numpy as np
matrix = np.array([[1, 0, 0, 0,1,1, 0],
[0,1,0,0,0,1,1],
[0,0,1,0,1,1,1],
[0,0,0,1,1,0,1]])
G=matrix
matrix1=[]
R = int(input("Enter the number of rows of m: "))
C = int(input("Enter the number of columns of m: "))
for i in range(R): # A for loop for row entries
    a =[]
    for j in range(C): # A for loop for column entries
        a.append(int(input()))
    matrix1.append(a)
m=matrix1
C=[]
C = np.dot(m,G)
for i in range(1): # A for loop for row entries
    for j in range(7): # A for loop for column entries
        if C[i][j] %2 ==0:
            C[i][j] = 0
        else:
            C[i][j] = 1
print(C)
