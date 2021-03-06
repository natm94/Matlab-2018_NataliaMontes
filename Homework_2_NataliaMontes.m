% Homework_2_NataliaMontes.m
% this program answers questions for Chapter 2
% Written by Natalia Montes 1/2017

%% Q 2.1: 
%Replacing letters in strings

% a) Start with a string containing A PACK OF LIES and replace the P with an L and the L with a P.

str1 = 'A PACK OF LIES';
str1(3) = 'L';
str1(11) = 'P'; 
disp(str1)

% b) Start with a string containing It�s pouring with rain and replace the p with an r and the r with a p.

str2 = 'It�s pouring with rain';
str2(6) = 'r'; 
str2(9) = 'p';
str2(19) = 'p';
disp(str2)

% c) Now try to do this for both a) and b) in a single line of code.

%single line for a
str1(3:11)='LACK OF P' 
%single line for b
str2(6:19)='rouping with p'
 
%% Q 2.2: More replacing letters in strings.
%Starting with the string:

str = 'nosey little cook';
str(1) = 'c';
str(14) = 'n';
id1 = (1:17);

% a) Create a vector called id1 so that when you type:
disp(str(id1))

% you get:         cosy little nook
% (Hint, write the phrase "nosey little cook" on a piece of paper and number each letter)
 
%% Q 2.3: Creating vectors.
 
% Create the following vectors using both linspace and the colon �:� technique

v = [20    18    16    14    12    10     8     6];
a = 20:-2:6
A = linspace(20, 6, 8)
v = [1.1000 1.3268 1.5537 1.7805 2.0074 2.2342 2.4611 2.6879 2.9147 3.1416];
% HELP on below
% b = (1.1000:0.2268:pi)
B = linspace(1.1000, pi, 10)
v = [20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1];
c = 20:-1:1
C = linspace(20, 1, 20)

 
%% Q 2.4: More indexing into strings.
 
%Start with the following string of 20 �x�s:
str = 'xxxxxxxxxxxxxxxxxxxx';

% a) Use indexing to make the 2, 5, 8th and so on ... letters in the string "z" and the 3rd, 6th and 9th and so on ... letter "p".  I.e. "xzpxzpxzpxzpxzpxzpxz"
str(2:3:end) = 'z';
str(3:3:end) = 'p';

% b) make the 5th , 6th  and 7th letters �r�.
str(5:7)='r';

% c) Demonstrate that the eight letter in the string is a 'z'
disp(str(8))

% d) Flip str so it is backwards (�zxpzxpzxpzxpzrrrxpzx�). Hint (use 2.3c)
% not sure what that hint means so I did this:
reverse = str(end:-1:1);

% e) Demonstrate that the 6th, 13th and 17th letters in the reversed string are �pzx�.
disp(reverse([6 13 17]))

%% Q 2.5: Indexing into vectors
 
% You ran an experiment where you took 20 measurements every 2.36 seconds starting 1.2 seconds into the experiment.
% a) Create a vector that describes the moments in time that these measurements were taken.
measurement=(1.2:2.36:60);
measurement=measurement(1:20);
% b) When was the fifth measurement taken?
measurement(5)
% c) Display the last measurement, using the end command
disp(measurement(end))
%% Q 2.6: Still more indexing

% Imagine you are running an experiment where 16 stimuli flash onto the screen. Subjects are asked to hit the 'h' key if they see a happy face and a �s� of they see a sad face.
% The sad faces were presented on trials: 1     2     6     7    10    13    14    15
% Start with stimlist='hhhhhhhhhhhhhhhh'
% a) Turn stimlist into a string showing which trials contained happy faces and which trials contained sad faces.
stimulist = 'hhhhhhhhhhhhhhhh';
stimulist([1 2 6 7 10 13 14 15]) = 's';
% During trials 1-4 and 9-12 sad music was playing. During the other trials happy music was playing. 
% b) Create two vectors, sadvect and happyvect that contain the trials when sad and happy music was playing, respectively. 
sadvect=([1:4 9:12]);
happyvect=([5:8 13:16]);
% At the end of the experiment, you end up with a string showing how the subject categorized the faces.

resplist='ssshhhshsshhsssh'; 
% I WAS VERY CONFUSED AT THIS PART -- I FEEL AS THOUGH I DIDN'T UNDERSTAND
% THE DIRECTIONS WELL
% c) Create strings stimlisthappy and resplisthappy that contain the 
% values in stimulist and resplist when happy music was playing
stimlisthappy = stimulist([5:8 13:16]);
resplisthappy = resplist([5:8 13:16]);
% d) Find out which stimulus was being presented on the 3rd happy music trial.
stimlisthappy(3)
% e) Find out which responses were made on the 3rd, 4th and 5th sad music trial.
resplistsad=resplist([1:4 9:12]);
resplistsad([3 4 5])