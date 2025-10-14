%Explain and implementation of Convolution operation of sequences.

clc;
clear;

x = input('Enter the input sequence 1: ');   % sequence 1
h = input('Enter the input sequence 2: ');   % sequence 2

a	= length(x);            % Number of elements in sequence 1
b	= length(h);            % Number of elements in sequence  2
N = a + b - 1;            % Length of convolution output

% Zero padding to equal length
X = [x, zeros(1, N-a)];
H = [h, zeros(1, N-b)];

% Initialize output
Y = zeros(1, N);

% Convolution calculation
for i = 1:N
   for j = 1:a
      if (i-j+1 > 0)
         Y(i) = Y(i) + X(j) * H(i-j+1);
      end
   end
end

% Plotting input and output
subplot(2,2,1)
stem(0:a-1, x,'filled');
grid on;
ylabel('x[n]');
xlabel('n');
title('Sequence x[n]');

subplot(2,2,2)
stem(0:b-1, h, 'filled');
grid on;
ylabel('h[n]');
xlabel('n');
title('Sequence h[n]');

subplot(2,2,[3 4])
stem(0:N-1, Y, 'filled');
grid on;
ylabel('Y[n]');
xlabel('n');
title('Convolution of Two Signals');

disp('Convolution result:');
disp(Y);

%input for x = [2 3 4]
%input for h = [1 2 3]

