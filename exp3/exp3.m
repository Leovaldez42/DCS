% Aim: To check if the given degree m polynomial is primitive or not

clear;
m = input("Enter the degree of polynomial : ");
a=zeros(1,m+1);
for i=0:1:m
    fprintf("Coef of x%d",i);
    a(1,i+1)=input('');
end
disp('The given polynomial is : ')
a;
k = gfprimck(a);
% -1 if a is not an irreducible polynomial
% 
% 0 if a is irreducible but not a primitive polynomial for GF(pm)
% 
% 1 if a is a primitive polynomial for GF(pm)
if (k==-1)
    fprintf("the given polynomial is not an irreducible")

elseif (k==1)
        
    fprintf("the given polynomial is primitive")

else
        fprinf("the given polynomial is irreducible but not primitive")
end