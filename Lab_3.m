clc; clear; close all;

% --- Step 1: Define n and initialize X(n) ---
n = -7:7;                 
x = zeros(1,length(n));      

% --- Step 2: Assign values according to the sequence ---
x(n == -2) = 2;           % corresponds to 2δ(n+2)
x(n == 4) = -1;           % corresponds to -δ(n-4)

% --- Step 3: Plot the sequence ---
stem(n, x, 'filled');     
title('X(n) = 2\delta(n+2) - \delta(n-4)');
xlabel('n');
ylabel('X(n)');
grid on;
