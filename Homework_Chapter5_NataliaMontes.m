%% Chapter 5 
% Natalia Montes

%% Q 5.1 

clear all
flagsize=15;
saltire=zeros(flagsize);

for i=1:flagsize
    saltire(i, i)=1;
    saltire((flagsize+1)-i, i)=1;
end

figure(1)
image(saltire+1)
cmap=[0 0 1; 1 1 1];
colormap(cmap)

figure(2)
image(saltire+1)
cmap= [1 0 0; 1 1 1];
colormap(cmap)

george=zeros(flagsize);
george(:, ceil(flagsize/2)) =1;
george(ceil(flagsize/2), :) = 1;
figure(3)
image(george+1)
cmap=[ 1 1 1 ; 1 0 0];
colormap(cmap)


union=(saltire+(2*george))+1;
union(union>3)=3;
figure(4)
image(union)

cmap(1, :)= [0 0 1];
cmap(2, :)= [1 0 0];
cmap(3, :)= [1 0 0];
colormap(cmap)


bars=[ceil(flagsize/2)-1 ceil(flagsize/2)+1];
union(bars, :)=union(bars, :)+3;
union(:,bars)=union(:, bars)+3;
union(union>6)=union(union>6)-3; 
union(:, ceil(flagsize/2)) =2;
union(ceil(flagsize/2), :) = 2;
figure(5)
image(union)

cmap(4, :)= [1 1 1];
cmap(5, :)= [1 1 1];
cmap(6, :)= [1 1 1];
colormap(cmap);

for i=1:flagsize
    for j=1:flagsize
    if i==j-1 || j==i-1 || i==j+1 || j==i+1 
            if union(i, j)<6
                union(i, j)=5;
                union(i, flagsize-j+1)=5;
            end
        end
    end
end
union(:, ceil(flagsize/2)) =2;
union(ceil(flagsize/2), :) = 2;

figure(6)
image(union)
colormap(cmap)
axis off; axis equal

%% Q 5.2 

% Miguel collects data for an EEG experiment.  
% Each session of data consists of 30 trials, each lasting 5s. 
% The EEG machine records data every 2ms. 
% Strangely his data looks like a perfect sinusoid, 
% with 0 mean normally distributed noise. 
clear dataextract 
clc
ntrials=30;
durtrial=5*1000;
timevec=0:2:durtrial*ntrials;
data=sin((2*pi* timevec)/(durtrial))+.1*randn(size(timevec));
plot(timevec, data, '-')

% a)  What is the mean response during all the data points that are within 
% the first ½ second of every trial 

t = 5000;
npts = 2500;
nptsI = 250;


% nicely done!
dataextract = zeros(nptsI, ntrials);

for j = 1:ntrials
    dataextract(:,j) = data(npts*(j-1)+1 : npts*(j-1)+250); 
end

a = mean(dataextract(:))

% b) What is the mean response during the interval 2-2.5s of each trial?
dataextract = zeros(nptsI+1, ntrials);

for j = 1:ntrials
    dataextract(:,j) = data(npts*(j-1)+1000 : npts*(j-1)+1250); 
end

b = mean(dataextract(:))


% c) during which timepoints does the EEG response have values greater than 0.9?

c = find(data>0.9);

% d) during which timepoints does the EEG response have values between 0.7 and 0.8?
% (obviously you will get different answers each time because your data will vary each time).

c = find((data <0.7) | (data >0.8));
timevec(c);

%% 5.3 HELP

% Sam Lin collects data on 70 rats. 20 of them were duds and their data were thrown away. 

vect = 1:70;

ratID = vect(randperm(length(vect)));

ratID=sort(ratID(1:50)); 

% On the remaining rats he collects 10000 trials, 
% and he calculates the % correct across each bin of 100 trials.

vect = 1:50;
ratID=vect(randperm(length(vect))); 
ratID=sort(ratID(1:50)); 
binsteps=1:100:10000;
[X, Y]=meshgrid(1:length(ratID), 1:length(binsteps));
per=Y+randi(10, size(Y))-5;
per(per>100)=100; per(per<0)=0;

% a) image the rats performance in a matrix with trials along the x axis 
% and rats along the y axis using a colormap that varies between white for 
% 100% correct and black for 0% correct (not using imagesc)

image(per')
colormap(gray(100))

% b) change the colormap so that values above 90% are white and values below 10% are black.

cmap=gray(100);
cmap(1:10,:)= 0;
cmap(91:100,:)= 1;
colormap(cmap)

% for x 

% c) how many rats performed above 66% correct between trials 6001-7001?


perC = per;
perC(find(binsteps>7001), :) = NaN; % each bin has 100 trials and you need to put the Nans in perC
perC(find(binsteps<6001), :) = NaN;
imagesc(perC)
tmp=nanmean(perC, 1);
nrats=length(find(tmp>66));

% d) which rats were they?

ratID(find(tmp>66))

% e) How many trials would be needed for 40/50 rats to be performing above 80%.


per80=per>80;
numover80=sum(per80,2);
minTover80=find(numover80>40);
minTover80(1);
binsteps(minTover80)

% f) It turns out that for the rats with even ID numbers (2, 4, 6 10 etc.) 
% the recording machine was on the blink for an interval between the 5678th 
% trial and the 7533rd trial. Convert those numbers to NaN.


badRats=find(mod(ratID,2)==0);
per( 56:76, find(mod(ratID,2)==0))=NaN;

figure(3)
clf
image(binsteps,size(ratID),per');
colormap(gray(100));
xlabel('Trial');
ylabel('Rat');
colorbar
