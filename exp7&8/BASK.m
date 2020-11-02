% ********************* BASK Modulation and Demodulation ******************

clc;
clear;
close all;

% ********************* Define transmitted signal *************************

N=10; % Number of bits , size of transmitted signal x_inp=[x_1 x_2 ... x_N] 
x_inp= randi(1,N);  % binary signal 0 or 1 % message to be transmitted                               
Tb=0.0001; % bit period (second)   

% ********************* Represent input signal as digital signal ****
x_bit=[]; 
nb=100; % bbit/bit
for n=1:1:N   % 
    if x_inp(n)==1  % 
       x_bitt=ones(1,nb);
    else x_inp(n)==0;
        x_bitt=zeros(1,nb);
    end
     x_bit=[x_bit x_bitt];
end

t1=Tb/nb:Tb/nb:nb*N*(Tb/nb); % time of the signal 
f1 = figure(1);
set(f1,'color',[1 1 1]);
subplot(3,1,1);
plot(t1,x_bit,'lineWidth',2);grid on;
axis([ 0 Tb*N -0.5 1.5]);
ylabel('Tmplitude(volt)');
xlabel(' Time(sec)');
title('Input signal as digital signal');



% ********************* Define BASK Modulation ****************************
Ac1=15; % Amplitude of carrier signal for bit 1
Ac2=10; % Amplitude of carrier signal for bit 0
mc=10;  % fc>>fs fc=mc*fs fs=1/Tb 
fc=mc*(1/Tb); % carrier frequency 
t2=Tb/nb:Tb/nb:Tb;                 
t2L=length(t2);
x_mod=[];
for (i=1:1:N)
    if (x_inp(i)==1)
        x_mod0=Ac1*cos(2*pi*fc*t2);%modulation signal with carrier signal 1
    else
        x_mod0=Ac2*cos(2*pi*fc*t2);%modulation signal with carrier signal 2
    end
    x_mod=[x_mod x_mod0];
end
t3=Tb/nb:Tb/nb:Tb*N;
subplot(3,1,2);
plot(t3,x_mod);
xlabel('Time(sec)');
ylabel('Amplitude(volt)');
title('Signal of  BASK modulation ');

% ********************* Transmitted signal x ******************************
x=x_mod;

% ********************* Channel model h and w *****************************
h=1; % Fading 
w=0; % Noise

% ********************* Received signal y *********************************
y=h.*x+w;


% ********************* Define BASK Demodulation **************************

y_dem=[];
for n=t2L:t2L:length(y)
  t=Tb/nb:Tb/nb:Tb;
  c=cos(2*pi*fc*t); % carrier siignal 
  y_dem0=c.*y((n-(t2L-1)):n);
  t4=Tb/nb:Tb/nb:Tb;
  z=trapz(t4,y_dem0); % intregation 
  A_dem=round((2*z/Tb));                                     
  if(A_dem>((Ac1+Ac2)/2)) % logic level = (Ac1+Ac2)/2
    A=1;
  else
    A=0;
  end
  y_dem=[y_dem A];
end

x_out=y_dem; % output signal;

% *************** Represent output signal as digital signal ***************
xx_bit=[];
for n=1:length(x_out)
    if x_out(n)==1
       xx_bitt=ones(1,nb);
    else x_out(n)==0;
        xx_bitt=zeros(1,nb);
    end
     xx_bit=[xx_bit xx_bitt];

end
t4=Tb/nb:Tb/nb:nb*length(x_out)*(Tb/nb);
subplot(3,1,3)
plot(t4,xx_bit,'LineWidth',2);grid on;
axis([ 0 Tb*length(x_out) -0.5 1.5]);
ylabel('Amplitude(volt)');
xlabel(' Time(sec)');
title('Output signal as digital signal');


% **************************** end of program *****************************
