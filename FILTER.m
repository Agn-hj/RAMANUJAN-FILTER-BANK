clc;
close all;
clear all;
F=0.014;
T=1/F;
L = 280;  
t = (0:L-1); 
subplot(2,2,1);
n=sin(2*pi*F*t);
k=randn(size(t));
x = sin(2*pi*F*t)+0.1*randn(size(t));
plot(x);
ylabel('Amplitude');
xlabel('Time');
subplot(2,2,2);
xdft = fft(x);
Pxx = 1/(L*F)*abs(xdft(1:length(x)/2+1)).^2;
plot(Pxx);
xlabel('Hz'); ylabel('dB/Hz');
[maxval,idx] = max(abs(xdft));
freq = (F*(idx-1))/length(x);
time=1/freq;
s=0;
for t=0.0:1.0:4000.0
    s=n+s;
end
m=s/4000;
disp(m);
v=0;
for t=0.0:1.0:4000.0
    l=n-m;
    v=l+v;
end
var=v/4000;
disp(var);
s1=0;
for t=0.0:1.0:4000.0
    s1=k+s1;
end
m1=s1/4000;
disp(m1);
v1=0;
for t=0.0:1.0:4000.0
    l1=k-m1;
    v1=v1+l1;
end
var1=v1/4000;
disp(var1);
snrrat=10*log10(var/var1);
disp(snrrat);
subplot(2,2,3);
mtp=pmtm(x);
plot(mtp);
ylabel('Amplitude');
xlabel('Time');
u=snr(mtp);
subplot(2,2,4);
mtp1=pmtm(Pxx);
plot(mtp1);
xlabel('Hz'); ylabel('dB/Hz');
t=findpeaks(x);
freqp=mean(diff(t));
time=(1/freqp);
RFB(x,150,5,4,0.1)



