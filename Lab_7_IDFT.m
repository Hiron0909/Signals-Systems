clc;
clear;
close all;

%----------------- Given DFT sequence -----------------
X = [10 -2+2j -2 -2-2j];
N = length(X);

%----------------- Compute IDFT -----------------
y = zeros(1, N);   % reconstructed signal
for n = 0:N-1
    for k = 0:N-1
        y(n+1) = y(n+1) + X(k+1) * exp(1j*2*pi*k*n/N);
    end
    y(n+1) = y(n+1)/N;
end

%----------------- Plots -----------------

% Original signal (from IDFT)
figure
stem(0:N-1, real(y), 'filled');
title('Original Signal x[n] (from IDFT)');
xlabel('n'); ylabel('x[n]');
grid on;

% DFT Magnitude
figure
stem(0:N-1, abs(X), 'filled');
title('DFT Magnitude |X(k)|');
xlabel('k'); ylabel('|X(k)|');
grid on;

% DFT Phase
figure
stem(0:N-1, angle(X), 'filled');
title('DFT Phase ∠X(k)');
xlabel('k'); ylabel('Phase (radians)');
grid on;
