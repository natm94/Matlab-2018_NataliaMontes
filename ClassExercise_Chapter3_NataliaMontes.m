%% Questions for Chapter 3
% Natalia Montes
% Due 1/22/17 before class

%% Q 3.1: Basic calculations.

%Create the following matrix mat:

mat=[1:4;4:7;8:11]; 

%If you look at the size of mat you will see that it has 3 rows and 4 columns.

size(mat)

%a) Before typing anything in, guess what will result from:
% mat + 1
% my guess = +1 to every value of matrix 
mat + 1;
%b) Guess what you get when you type:
% 10-mat
% my guess is 10 - every value of the matrix
10-mat;

% c) Use the command min to calculate the minimum of each column of mat
min(mat);
% d) Use min and the transpose (‘) to calculate the minimum of each row of mat
min(mat');
% e) Use min twice to calculate the minimum of the entire matrix
min(min(mat));
%% Q 3.2: Calculations with vectors.

% Define the following vectors:

v1 =[1 2 3 4];
v2 =[1 0 1 0];

%Before typing anything in, guess what will result from:
% a) v1 + v2
% guess = 2 2 4 4
v1+v2;
% b) v1 .* v2
% guess = 1 0 3 0
v1 .* v2;
% c) sum(v1.*v2)
% guess = all values of v1 multiplied by the corresponding value of v2
% added up
sum(v1.*v2);
% d) v1 * v2'
% guess = 0+2+0+4
sum(v1 * v2');
%% Q 3.5: More calculations with vectors

% Calculate the sum of all odd numbers from 1 to 99
vecOdd = 1:2:99;
sum(vecOdd)
%% Q 3.6: Making pi

% The number ? can be expressed as:

% ?= ?(6/1^2 +6/2^2 +6/3^2 +6/4^2 +6/5^2 +?)

% We’ll approximate this in the following steps:

% a) Generate a vector ‘a’ that counts in steps of 1 from 1 to 10,000 (don’t forget the semicolon to suppress the output!)

a = 1:10000;

% b) Square every element of that vector and call this vector ‘b’.

b = a.^2;

% c) Create a new vector (‘c’) that is 6 divided by every element of vector b

c = b./6;
 
% d) Create a scalar ‘d’ that is the sum of vector ‘c’

d = sum(c); 

% e) Take the square root of scalar d.

sqrt(d)

% f) For extra credit, try to do to this all in a single line!

sqrt(sum((1:10000).^2)./6)

%% Q 3.7: Inner and Outer Products
% 
% Let the vector ‘heights’ be a list of heights in inches:

heights = [66 68 65 70 65]';
%
% a) Find the average of these heights by adding the heights and dividing by 5

sum(heights)/5;

% b) use Matlab’s ‘mean’ function to get the same number

mean(heights);

% Let the vector V2 be: 

w = [1 1 1 1 1]/5;
% 
% c) Show that the inner product of w and heights is the same as the mean. Do you see why?

sum(w*heights);
mean(w*heights);

% d)  Now let 
w = [1 1 1 0 1]/4;
% 
% Show that the inner product of w and heights is the mean height after taking out the fourth value.

sum(w[1 2 3 5]*heights); %Help!
