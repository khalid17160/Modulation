
fs = 5e5;      % sampling frequency of original signal : almost continuous
fm  = 1e3;      % Message signal frequency 
figure(7);
Am=2;

t = 0 : 1/fs : 10*1/fm;  % time axis
x = Am*cos(2*pi*t*fm);          % message Signal
subplot(3,1,1);
plot(t,x);                      % plot of msg signal
xlabel('message');
subplot(3,1,2);
hold on;
plot(t,x);
xlabel('message vs Sample');
fs2 = 8e3;     %21             %Sampling frequency
t2 = 0 : 1/fs2 : 10*1/fm-1/fs2; 
x2 = Am*cos(2*pi*t2*fm);         %Sampling
stem(t2,x2);                    %plot for sampling

x3=x2;      
[m,n]=size(t2);
code=zeros(1,n);
% error=0;                         

delta = 1/2;            %delta=2*M/L
for i=1:n
    if(x2(i)>=-4*delta && x2(i)<=-3*delta)          
           code(i)=0;
            x3(i)=-(7*delta)/2;
    elseif(x2(i)>=-3*delta && x2(i)<=-2*delta)
           code(i)=1;
            x3(i)=-(5*delta)/2;
    elseif(x2(i)>=-2*delta && x2(i)<=-delta)
           code(i)=2;
           x3(i)=-(3*delta)/2;
    elseif(x2(i)>=-delta && x2(i)<=0)
           code(i)=3;
           x3(i)=-(delta)/2;
    elseif(x2(i)>=0 && x2(i)<=delta)
           code(i)=4;
           x3(i)=delta/2;
    elseif(x2(i)>=delta && x2(i)<=2*delta)
           code(i)=5; 
           x3(i)=(3*delta)/2;
    elseif(x2(i)>=2*delta && x2(i)<=3*delta)
           code(i)=6;
           x3(i)=(5*delta)/2;
    elseif(x2(i)>=3*delta && x2(i)<=4*delta)
           code(i)=7;
           x3(i)=(7*delta)/2;
    end
    
    
end
    temp=x2-x3;
    temp1=temp.*temp;
    error=sum(temp1);
mean_sqr_error=error/n;
disp(code);
disp(de2bi(code));
subplot(3,1,3);
hold on;
yticks(-Am:delta/2:Am);
plot(t,x);
stem(t2,x3);
xlabel('message vs quantization');
%mean square quantization error
disp(mean_sqr_error);
fprintf('mean square quantization error : %i \n',mean_sqr_error);