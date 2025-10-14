%power density spectrum of a square wave
A = 1;                 % Amplitude
T = 2*pi;              % Period
w0 = 2*pi/T;           % Fundamental frequency
N = 25;                % Number of harmonics
n = -N:N;              % Harmonic indices
Cn = zeros(size(n));   % Initialize Fourier coefficients

% Calculate Fourier coefficients (only odd harmonics)
for k = 1:length(n)
    if mod(n(k), 2) ~= 0          % Odd harmonics
        Cn(k) = 2*A./(1j*pi*n(k));
    end
end

P = abs(Cn).^2;        % Power spectrum

% Plot Power Density Spectrum
stem(n*w0, P, 'filled');
title('Power Density Spectrum of Square Wave');
xlabel('Frequency (rad/s)');
ylabel('|C_n|^2');
grid on;
