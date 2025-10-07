% --- Experiment: Implementation of Signal Operations (Addition, Folding, and Shifting) ---

clc; clear; close all;

% Time index
n = -5:5;

% Example input signals
x1 = [0 0 1 2 3 4 5 3 2 1 0];   
x2 = [0 0 2 2 2 2 2 2 2 0 0];   

% ---- 1) ADDITION ----
[y_add, n_add] = add_signal(x1, n, x2, n);

% ---- 2) FOLDING ----
[y_fold, n_fold] = fold_signal(x1, n);

% ---- 3) SHIFTING ----
k = 2; % shift right by 2
[y_shift, n_shift] = shift_signal(x1, n, k);

% ---- PLOTTING ----
figure('Name','Signal Operations','NumberTitle','off');

subplot(3,1,1);
stem(n_add, y_add, 'filled'); grid on;
title('Addition: y(n)=x_1(n)+x_2(n)');
xlabel('n'); ylabel('Amplitude');

subplot(3,1,2);
stem(n_fold, y_fold, 'filled'); grid on;
title('Folding: y(n)=x_1(-n)');
xlabel('n'); ylabel('Amplitude');

subplot(3,1,3);
stem(n_shift, y_shift, 'filled'); grid on;
title(['Shifting: y(n)=x_1(n-' num2str(k) ')']);
xlabel('n'); ylabel('Amplitude');

% ---- FUNCTIONS ----
function [y, n_out] = add_signal(x1, n1, x2, n2)
    n_out = min([n1 n2]):max([n1 n2]); % total range
    y1 = zeros(size(n_out)); 
    y2 = zeros(size(n_out));
    y1(ismember(n_out,n1)) = x1;
    y2(ismember(n_out,n2)) = x2;
    y = y1 + y2;
end

function [y, n_out] = fold_signal(x, n)
    n_out = -fliplr(n);
    y = fliplr(x);
end

function [y, n_out] = shift_signal(x, n, k)
    n_out = n + k;
    y = x;
end
