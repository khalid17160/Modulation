fs=20000;
Ts=1/fs;
N=1000;
t=0:Ts:N*Ts-Ts;


fc=2000;
fm=20;
Ac=1;
Am=1;
figure(2);
carrier=Ac*sin(2*pi*fc*t);
message=Am*sin(2*pi*fm*t);
hold on;
subplot(3,3,1:3);
 plot(t,carrier);
xlabel('Time axis');ylabel('Amplitude');
title('Carrier');
subplot(3,3,4:6);
xlabel('Time axis');ylabel('Amplitude');
title('Message');
plot(t,message);
mu=0.5;
modulated = (1+mu.*message).*carrier;

subplot(3,3,7:9)
xlabel('Time axis');ylabel('Amplitude');
title('Modulated');
plot(t,modulated);