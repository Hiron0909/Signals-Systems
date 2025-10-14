%Implementation DFT Signal

clc;
clear;
close all;

% Input sequence
x = [1 2 3 4];   % Example input signal
N = length(x);   % Length of sequence

% Initialize DFT output
X = zeros(1, N);

% DFT formula implementation
for k = 0:N-1
    for n = 0:N-1
        X(k+1) = X(k+1) + x(n+1) * exp(-1j * 2 * pi * k * n / N);
    end
end

% Display the result
disp('Input sequence x(n):');
disp(x);
disp('DFT of x(n):');
disp(X);

% Plot magnitude and phase spectrum
k = 0:N-1;
subplot(2,1,1);
stem(k, abs(X), 'filled');
title('Magnitude Spectrum');
xlabel('Frequency Index (k)');
ylabel('|X(k)|');
grid on;

subplot(2,1,2);
stem(k, angle(X), 'filled');
title('Phase Spectrum');
xlabel('Frequency Index (k)');
ylabel('∠X(k) (radians)');
grid on;
