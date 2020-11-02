% Find the primitive elements from the given set of mod-n

G = input('enter the set : ');
n = input('enter the value of n : ');
TF = isPrimitiveRoot(G,n);
disp("the primitive elements are : ")
disp(G(TF))