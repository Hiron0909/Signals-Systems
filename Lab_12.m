% To find the amplitude of the multi frequency signal:
% X(t)= cos(2π100t) + cos(2π500t) +cos(2π700t)
% And also show approximate the Fourier transform integral for 0≤f≤900 Hz.


% Clear workspace
clear; clc; close all;

% Parameters
N = 250;            % Number of samples
ts = 0.0002;        % Sampling interval (seconds)
t = (0:N-1) * ts;   % Time vector

% Signal: sum of three cosines
x = cos(2*pi*100*t) + cos(2*pi*500*t) + cos(2*pi*700*t);

% Plot time-domain signal
figure;
subplot(2,1,1);
plot(t, x, 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Amplitude');
title('Time-Domain Signal x(t)');
grid on;

% Compute DTFT using numerical integration
f = 0:1:900;        % Frequency range from 0 to 900 Hz
X = zeros(size(f)); % Initialize amplitude spectrum

for k = 1:length(f)
    X(k) = trapz(t, x .* exp(-1j*2*pi*f(k)*t)); % Numerical integration
end

% Plot amplitude spectrum
subplot(2,1,2);
plot(f, abs(X), 'LineWidth', 1.5);
xlabel('Frequency (Hz)');
ylabel('|X(f)|');
title('Amplitude Spectrum of x(t)');
xlim([0 900]); % Show only 0 <= f <= 900 Hz
grid on; 
