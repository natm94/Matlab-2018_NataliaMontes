%% Chapter 4 Class Exercises 
% Natalia Montes 

%% Q 4.1 

A = ones(5);
A(3:5, :) = 2;
A

B = ones(4, 5); 
B(:, 3:4) = 0; 
B 

C = ones(6, 5); 
C(2:4, 2:3)=0;
C

for i = 1:5
    D(:, i) = [1:5];
end
D

E = ones(6, 6);
for i = 1:6;
    for j = i:6; 
        E(i, j) = 2; 
    end 
end
E

F = zeros(5, 5); 
for i = 2:5; 
    F(:, i) = (i*5)-5;
end
F

G = zeros(5, 5); 
for i = 1:5
    G(:, i) = [1:5] + (i-1)*5;
end
G

H = ones(8, 8);
H(:, 2:2:end) = 0;
H

I = zeros(8, 8);
for i = 1:2:8
    I(i, i) = 1;
end
I

K = ones(5, 5); 
for i = 1:5 
    K(i, :) = i:i:5*i; 
end
K

L = ones(5, 5); 
for i = 1:5
    L(i, :) = [1:5]+((i-1)*5); 
end
L 

%% Q 4.2

% a
MAT = zeros(3, 3, 3); 
MAT(2, 2, 2) = 1; 
MAT

% b
MAT2 = zeros(5, 5, 5); 
MAT2(2:4, 2:4, 2:4) = 1; 
MAT2

%% Q 4.3

% a 
sub2ind([4,3], 3, 2) 

% b 
[i, j] = ind2sub([4,3], 7)

%% Q 4.4

% a
x = 5;
y = 0;
z = -5;

if x>0
    disp('x is positive')
elseif x<0
    disp('x is negative')
end 

% b
x < 2 || x > pi 

% c 
(x>2 && y < 4) || z==0

%% Q 4.5

count = 1; 
roll = ceil(rand(1,2)*6); 
while sum(roll) > 2
    count = count+1;
    roll = ceil(rand(1,2)*6);
end
disp(['Snake eyes after ' num2str(count), ' rolls!']);


    