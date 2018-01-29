% Making Matrices 
% provides cunning examples of ways to make matrices
% written IF 1/22/2018 


mat1=zeros(5,4)
mat2=mat1; 

mat2(1:5, 3)=1

%%
tic
mat=zeros(6);
for i =1:6
    mat(i, :)=[-2 0 -1 1 2 3]
    pause
end
mat2=mat1;
mat2(1:end, 3)=6
% can also be wrtten as mat2(:, 3)=6

mat2=mat1;
mat2(4, :)=1

%% Now for something interesting (for looping)

mat=zeros(4); %4x4 matrix of zeros 
for i=1:4 %i = index 
    mat(i, i)=i;
    pause
end 

%%

mat=zeros(5)
for i=[1 3] 
    for j = 1:4
        mat(i, j)=i+j
    end
end

%% single loop 
mat = zeros(3, 4)
for iRow = 1:3 
    mat(iRow, :) = ((iRow-1)*4)+[1:4]
end

%% repmat (replicating arrays)

x=[1 5 3 2 5]
size(x)
X = repmat(x, 3, 2)
size(x)

X = [2 3 4; 5 6 7]; 
size(X)
Y = repmat(X, 3, 2) 

%% 
mat = zeros(3, 4)
for iRow = 1:3
    mat(iRow, :)=((iRow-1)*4)+[1:4];
end
mat

%reshape = take a vector and make it into a vector of x rows and y columns
mat2 =reshape(1:12, 4, 3)' 

mat = [1 2 3; 4 5 6; 7 8 9];
vect=mat(:)

%% logical 1s and 0s

% basic conditional operators
% == 
% > 
% <
% || (or) 
%rr

rmat=rand(5, 5)
rmat2=rand(5, 5)

for iRow=1:size(rmat, 1)
    for iCol=1:size(rmat, 2)
        if rmat(iRow, iCol) < rmat2(iRow, iCol)
            rmat(iRow, iCol)=rmat2(iRow, iCol);
        end
    end
end
rmat

%% 

n1=6
if round(n1)==n1
    disp('n is a round number')
end
%%
n=-1

if n<0
    disp('bye bye sweetie');
    
elseif n
        disp ('hi there cutie pants');
else
    disp('hi there dearie');
end

%% order matters

n=-1
if n <=-.6
    disp('I love Calvin and Hobbes')
elseif n<=0
    disp('Garfield sucks')
elseif n>0 && n<=0.6
    disp('muchas smoochas')
else 
    disp('snuggle-puppy')
end 

%% wild loop

n=0;
while n<1
    n=randn(1); 
    disp(n)
end 

tic
while toc<3
end