%: Let x[n]={1,2,3,4,5,6,7,6,5,4,3,2,1}.Here bold number indicates the 0 index.
%Determine and plot the following sequences. y[n]=2x[n−5]−3x[n+4].

clc; clear; close all;
 
% Original sequence definition
 
x = [1 2 3 4 5 6 7 6 5 4 3 2 1];  % x[n]
x_n = -4:8;                       % indices for x[n]
 
 
% Plot the original sequence x[n]
 
figure;
stem(x_n, x, 'filled');           % stem plot of x[n]
xlabel('n'); 
ylabel('x[n]');
title('Original Sequence x[n]');
grid on;
 
 
% Prepare for shifting operations
 
y_n = -8:13;                      % union range to cover both shifts
x1 = zeros(1,length(y_n));        % preallocate for x[n-5]
x2 = zeros(1,length(y_n));        % preallocate for x[n+4]
 
 
% Compute shifted sequences with zero-padding
 
for k = 1:length(y_n)
    n = y_n(k);
    
    % ----- Compute x[n-5] -----
    idx1 = find(x_n == n-5);      % find index where n-5 exists
    if ~isempty(idx1)
        x1(k) = x(idx1);          % assign value if exists
    else
        x1(k) = 0;                % zero-padding if index out of range
    end
    
    % ----- Compute x[n+4] -----
    idx2 = find(x_n == n+4);      % find index where n+4 exists
    if ~isempty(idx2)
        x2(k) = x(idx2);          % assign value if exists
    else
        x2(k) = 0;                % zero-padding if index out of range
    end
end
 
 
% Plot shifted sequence x[n-5]
 
figure;
stem(y_n, x1, 'filled');
xlabel('n'); 
ylabel('x[n-5]');
title('Shifted Sequence x[n-5] (Right Shift by 5)');
grid on;
 
% Plot shifted sequence x[n+4]
 
figure;
stem(y_n, x2, 'filled');
xlabel('n'); 
ylabel('x[n+4]');
title('Shifted Sequence x[n+4] (Left Shift by 4)');
grid on;
 
% Compute and plot final output y[n]
 
y = 2*x1 - 3*x2;         % linear combination
 figure;
stem(y_n, y, 'filled');
xlabel('n'); 
ylabel('y[n]');
title('Final Sequence y[n] = 2x[n-5] - 3x[n+4]');
grid on;
