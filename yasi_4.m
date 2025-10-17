clc;
clear;
close all;

%% ============================
%  PART 1: SIGNAL ADDITION
%  Using user-defined function
% =============================
n1 = -4:1:1;                 
x1 = [3 5 0 2 4 6];          

n2 = -2:1:3;                 
x2 = [1 7 3 5 2 8];          

SignalAddition(n1, x1, n2, x2);


%% ============================
%  PART 2: SIGNAL FOLDING
% =============================
n = -3:2;                    
x = [1 -4 3 0 2 -1];         

SignalFolding(n, x);


%% ============================
%  PART 3: SIGNAL SHIFTING
% =============================
n = -2:2;                    
x = [3 -1 0 2 4];            
m1 = 3;  % right shift
m2 = 3;  % left shift

SignalShifting(n, x, m1, m2);



%% =========================================================
%   USER-DEFINED FUNCTION 1: SIGNAL ADDITION
% =========================================================
function SignalAddition(n1, x1, n2, x2)
    figure('Name', 'Signal Addition');

    % Align the signals using zero padding
    n_min = min(min(n1), min(n2)); 
    n_max = max(max(n1), max(n2)); 
    n = n_min:n_max; 

    y1 = zeros(1, length(n)); 
    y2 = zeros(1, length(n)); 

    for i = 1:length(n1) 
        idx = find(n == n1(i)); 
        y1(idx) = x1(i); 
    end 

    for i = 1:length(n2) 
        idx = find(n == n2(i)); 
        y2(idx) = x2(i); 
    end 

    y = y1 + y2; 

    % Plot the signals
    subplot(3,1,1); 
    stem(n1, x1, 'filled', 'k'); 
    title('Signal x1[n]'); 
    xlabel('n'); ylabel('Amplitude'); grid on; 

    subplot(3,1,2); 
    stem(n2, x2, 'filled', 'r'); 
    title('Signal x2[n]'); 
    xlabel('n'); ylabel('Amplitude'); grid on; 

    subplot(3,1,3); 
    stem(n, y, 'filled', 'b'); 
    title('Addition of Signals x1[n] + x2[n]'); 
    xlabel('n'); ylabel('Amplitude'); grid on;
end



%% =========================================================
%   USER-DEFINED FUNCTION 2: SIGNAL FOLDING
% =========================================================
function SignalFolding(n, x)
    figure('Name', 'Signal Folding');

    x_folded = fliplr(x);
    n_folded = fliplr(-n);

    subplot(2,1,1);
    stem(n, x, 'filled','b');
    title('Original Signal x[n]');
    xlabel('n'); ylabel('Amplitude'); grid on;

    subplot(2,1,2);
    stem(n_folded, x_folded, 'filled','r');
    title('Folded Signal x[-n]');
    xlabel('n'); ylabel('Amplitude'); grid on;
end



%% =========================================================
%   USER-DEFINED FUNCTION 3: SIGNAL SHIFTING
% =========================================================
function SignalShifting(n, x, m1, m2)
    figure('Name', 'Signal Shifting');

    n_right = n + m1;   % Right shift (delay)
    n_left  = n - m2;   % Left shift (advance)

    subplot(3,1,1);
    stem(n, x, 'filled','k');
    title('Original Signal x[n]');
    xlabel('n'); ylabel('x[n]'); axis([-6 6 -5 6]); grid on;

    subplot(3,1,2);
    stem(n_right, x, 'filled','b');
    title(['Right Shifted Signal x[n - ', num2str(m1), ']']);
    xlabel('n'); ylabel('x[n - m1]'); axis([-6 6 -5 6]); grid on;

    subplot(3,1,3);
    stem(n_left, x, 'filled','r');
    title(['Left Shifted Signal x[n + ', num2str(m2), ']']);
    xlabel('n'); ylabel('x[n + m2]'); axis([-6 6 -5 6]); grid on;
end
