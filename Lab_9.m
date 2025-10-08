clc; clear; close all;

Fs = 8000; 
L = 2000; 
t = (0:L-1)/Fs;
x = sin(2*pi*440*t);                % Original 440 Hz signal
noisy = x + 0.5*randn(size(t));     % Add random noise

Y = fft(noisy);                     % FFT of noisy signal
cutoff = 1000;                      % Cutoff frequency (Hz)
freq = (0:L-1)*(Fs/L);              
Y(freq > cutoff & freq < Fs-cutoff) = 0;  % Simple low-pass filter

cleaned = ifft(Y, 'symmetric');     % Inverse FFT to get cleaned signal

figure;
subplot(3,1,1), plot(t(1:500), noisy(1:500)), title('Noisy Signal'), ylabel('Amplitude');
subplot(3,1,2), plot(freq(1:L/2), abs(Y(1:L/2))/L), title('Frequency Spectrum'), ylabel('|Y|');
subplot(3,1,3), plot(t(1:500), cleaned(1:500)), title('Cleaned Signal'), xlabel('Time (s)'), ylabel('Amplitude');

% sound(x, Fs); pause(2); sound(noisy, Fs); pause(2); sound(cleaned, Fs);
