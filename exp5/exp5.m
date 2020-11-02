% Construct generator polynomial for (n, k) cyclic code.

n = input("code word length : ");
k = input("message length : ");

poly = cyclpoly(n,k);

disp("the generator polynomial is ")
disp(poly2sym(poly))
