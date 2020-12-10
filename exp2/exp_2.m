clc
a=input("Enter the vectors ");
r=gfrank(a,2);
[x,y]=size(a);
if r<x
    disp("Linearly Dependent");
else
    disp("Linearly Independent");  
end
