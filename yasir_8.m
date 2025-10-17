N = 256;                
% Number of samples 
Fs = 128;               
T = 1 / Fs;             
k = 0:N-1;              
time = k * T;          
% Sampling frequency in Hz 
% Sampling interval 
% Sample indices 
% Time vector 
% ===== Signal definition ===== 
f = 0.25 + ... 
2*sin(2*pi*5*time) + ... 
1*sin(2*pi*12.5*time) + ... 
1.5*sin(2*pi*20*time) + ... 
0.5*sin(2*pi*35*time); 
% ===== Plot time-domain signal ===== 
figure; 
plot(time, f, 'LineWidth', 1.5); 
xlabel('Time (seconds)'); 
ylabel('Amplitude'); 
title('Signal sampled at 128 Hz'); 
grid on; 
% ===== FFT computation ===== 
F = fft(f); 
% Magnitude spectrum (single-sided) 
magF = abs(F(1:N/2)) / (N/2); 
magF(1) = magF(1) / 2; % Adjust DC component 
% Frequency axis 
hertz = (0:N/2-1) * (Fs/N); 
% ===== Plot frequency-domain ===== 
figure; 
stem(hertz, magF, 'filled'); 
xlabel('Frequency (Hz)'); 
ylabel('Magnitude'); 
title('Frequency components'); 
grid on;
