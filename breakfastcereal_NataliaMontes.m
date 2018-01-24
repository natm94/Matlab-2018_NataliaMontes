%% BreakfastCereal 
% due before class 1/17
%% Q2.1
frosted='FROSTED FLAKES';
cheerios='CHEERIOS';

frosted_scrambled = frosted; 

frosted_scrambled(9)='E';

frosted_scrambled([6 13]) = ['F' 'X'];

ff=find(frosted == 'F')
%% Q2.2
str = 'MACARONI AND CHEESE' 

id1= [1 2 7 9 14 15 16 17 18 19];

str(id1);

id2 = [15 16 5 9 1 8 7 12 9 8 18 9 3 15 8 7 19 18 19];

str(id2)

%% Q2.3
%a 
A=1:10
a=linspace(1, 10, 10)
%b
B=10:2:18
b=linspace(10, 18, 5)
%c
C=19:-1:15
c=linspace(19, 15, 5)
%d
D=10:-2:-4
d=linspace(10, -4, 8)
%e
E=0:3.1416:15.7080
e=linspace(0, 15.7080, 6)
%f
F=0:pi:5*pi
f=linspace(0, 5*pi,6)

%% Q2.4
str='aaaaaaaaaaaaaaaaaaaa';
str(3:3:end)='c';
str(2:3:end)='b';
disp(str(3))
str(4:6)='def';
str([4:6 10:12 16:18])='defdefdef';
str([4+(0:2) 8+(0:2) 16+(0:2)])='defdefdef';
str([6 12 18])
%% Q2.5

measurement=(12:1.23:100);
measurement=measurement(1:40);

measurement=linspace(12, 12+(39*1.23), 40);

measurement(5)
measurement(end)

%% Q2.6
resp='rerekererererererererererererererererere';
disp(resp(5));
resp(5)='r';
resp(5);
disp(resp(2:2:end))

%% Q2.7 ?? Confused! Output gives all errors

% I'm not getting errors so I'm confused about your confusion. If you are
% still confufe come see me?


vect = 12:-1:1

% a) Guess for vect(1:12) 

vect(1:12)
% b) Guess for vect(12:-1:1) 

vect(12:-1:1) 
% c) Guess for vect([10 12 9 12 8 4]) = 10 12 9 12 8 4
vect([10 12 9 12 8 4])
% d) Guess for vect(1:2) = 1 2
vect(1:2)
% e) Guess for vect(vect(1:2:)) = error? 
vect(vect(1:2))
% f) Guess for vect(vect) = 12 11 10 9 8 7 6 5 4 3 2 1 
vect(vect)
% e) Guess for vect(vect(vect))= error?
vect(vect(vect))


