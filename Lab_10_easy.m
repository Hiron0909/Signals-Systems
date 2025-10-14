%Show Power Density Spectrum of a Square Wave.

clc; clear; close all;

Fs = 1000;           % Sampling frequency
t = 0:1/Fs:1-1/Fs;   % Time vector
f = 5;               % Frequency of square wave

x = square(2*pi*f*t); % Generate square wave

% Compute Power Spectral Density
[Pxx,freq] = periodogram(x,[],[],Fs);

% Plot PSD
figure;
plot(freq,10*log10(Pxx));   % in dB
title('Power Density Spectrum of a Square Wave');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
grid on;
