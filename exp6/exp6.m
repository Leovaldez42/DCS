n = input("code word length : ");
k = input("message length : ");

poly = cyclpoly(n,k);
disp("The generator polynomial is : ")
disp(poly2sym(poly))
fprintf("\n")
[m,generator_matrix] = cyclgen(n,poly,'system');

disp("The generator matrix is : ")
disp(generator_matrix)
