clc;
n =input('Enter the codeword length: ');
k =input('Enter the number of parity bits: ');
m = input('Enter message the sequence(in the form [x,x,x,x]):');
pol=cyclpoly(n,k);
[h,g]=cyclgen(n,pol);
p=g(:,1);
 
for i=2:1:n-k
    p1=g(:,i);
    p=cat(2,p,p1);
end
ig=eye(k);
ih=eye(n-k);
g=cat(2,ig,p);
h=cat(2,p,ih);
c=mod(m*g,2);
disp("G(Generator) matrix");
disp(g);
disp("P(Parity) matrix");
disp(p);
disp("H(Parity-Check) matrix");
disp(h);
disp("Codeword");
disp(c);
 
 
 
l=input("Select a position to flip the bit in received code : ");
if(c(l)==0)
    c(l)=1;
else
    c(l)=0;
end
 
r=c;
disp("Codeword with error at 1 bit");
disp(r);
H=transpose(h);
S=mod(r*H,2);
disp("Syndrome:");
disp(S);
 
 
temp=0;
for i=1:1:n-k
    if(S(i)==0)
        continue;
    else
        temp=1;
        break;
    end
end
if(temp==0)
    disp("NO ERROR");
else
    for j=1:1:n-k
        
    
     ErrPos =1;
        for i=1:1:n
            d=[h(:,ErrPos)]
            d=d;
            
            temp2=0;
            for i=1:1:n-k
                if(d(i)==S(i))
                    continue;
                else
                    temp2=1;
                    break;
                end
            end
            if(temp2==1)
                ErrPos=ErrPos+1;
                continue;
            else
                break;
            end
        end
    end
end
        disp("Error at bit:");
        disp(ErrPos)
        if(r(ErrPos) == 0)
            r(ErrPos) = 1;
            disp("The Codeword is restored by flipping the error bit");
            disp(r);
        else
            r(ErrPos) = 0
            disp("The Codeword is restored by flipping the error bit");
            disp(r);
        end
msg=decode(c,n,k,'linear/binary',g);
disp("Decoded Message :");
disp(msg);