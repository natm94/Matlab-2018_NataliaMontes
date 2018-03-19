%% Homework 6 

%% Q 6.1

axis off

cmap = [1 1 1; 0.4 0.4 0.4; 0.8 0.8 0.8; 0.6 0.6 0.6];
% white = [1 1 1];
% darkgray = [0.4 0.4 0.4];
% lightgray = [0.8 0.8 0.8];
% medgray = [0.6 0.6 0.6];

figure(1)
[X, Y] = meshgrid(-12: 0.1: 12);
R = sqrt(X.^2+Y.^2);
M = ones(size(R));

smallradius = 2.5;
bigradius = 7;

[ylen xlen] = size(R); %number of rows, number of columns

for i = 20:xlen-20
    for j = 15:ylen-15
    if j > floor(ylen/2)
        M(i, j) = 3;
    end
    if j <= floor(ylen/2) 
        M(i, j) = 2;
    end
    
    end
end

M(R<bigradius & R>smallradius) = 4;
imagesc(M);
colormap(cmap)
axis off

figure(2)
for i = 20:xlen-20
    for j = 1:ylen
    if j > floor(ylen/2)
        M(i, j) = 3;
    end
    if j <= floor(ylen/2) 
        M(i, j) = 2;
    end
    
    end
end

M(R<bigradius & R>smallradius) = 4;

rip = ones(length(M), 20);
newM = [M(:, 1:ceil(length(M)/2)-1) rip M(:, ceil(length(M)/2):end)];


imagesc(newM);
colormap(cmap)
axis off

clear all 
% close all
figure(3)

cmap = [1 1 1; 0.4 0.4 0.4; 0.8 0.8 0.8; 0.6 0.6 0.6];
smallradius = 2.5;
bigradius = smallradius*2+smallradius;

coordMax = bigradius+2*smallradius;
coordMin = -coordMax;

space = 0.1;
[X, Y] = meshgrid(coordMin:space:coordMax);
R = sqrt(X.^2+Y.^2);
M = ones(size(R));
[ylen xlen] = size(R); %number of rows, number of columns

% no white at top
for i = 1:xlen
    for j = 1:ylen
    if j > floor(ylen/2)
        M(i, j) = 3;
    end
    if j <= floor(ylen/2) 
        M(i, j) = 2;
    end
    
    end
end
M(R<=bigradius & R>=smallradius) = 4;


newDim = length(M)+smallradius*2/space+1;
loc = smallradius*2/space+1;
Mbigger = ones(newDim,length(M));


M1 = M(:, 1:ceil(length(M)/2)-1);
[xM1 yM1] = size(M1);
Mbigger(1:xM1,1:yM1) = M1;

M2 = M(:, ceil(length(M)/2)+1:end);
[xM2 yM2] = size(M1);
Mbigger(loc+1:end,yM1+2:end) = M2;

Mad = ones(length(Mbigger),20);
Mbigger = [Mad Mbigger Mad];
imagesc(Mbigger);
colormap(cmap)


%% Q 6.2
[X, Y] = meshgrid(linspace(-1, 1, 500));
Tatan2(Y,X) * 180/pi;
T1 = mod(T1, 30);
T2 = mod(-T1, 30); 

R=X.^2+Y.^2;


imagesc(M); 
colormap(gray)

% setting background // finding x coords and y coords where values are
% greater than radius 

% SIMILAR BACKGROUND BUT SHIFTED
