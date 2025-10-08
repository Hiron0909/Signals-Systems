clc;
clear all;
close all;
N = 128;  %number of samples (signal length).            
k = 0:N-1; % discrete time index            
x = 0.25 + 2*sin(2*pi*5*k) + sin(2*pi*12.5*k) + 1.5*sin(2*pi*20*k) + 0.5*sin(2*pi*35*k);     
X = fft(x, N);

X_shifted = fftshift(X); 
      
X_mag = abs(X_shifted)/N; % magnitude spectrum   
f = (-N/2:N/2-1)/N; % frequency axis      
  
figure;
subplot(2,1,1);
stem(k, x, 'filled');
title('Time Domain Signal x(k)');
xlabel('k');
ylabel('x(k)');
grid on;

subplot(2,1,2);
stem(f, X_mag, 'filled');
title('Magnitude Spectrum of x(k)');
xlabel('Normalized Frequency (\times 2\pi rad/sample)');
ylabel('|X(f)|');
grid on;
