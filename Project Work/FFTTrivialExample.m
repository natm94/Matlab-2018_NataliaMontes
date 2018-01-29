% This program is a trivial example of the Fourier transform of a sinusoid 

clear all 
dt = .01;
maxt = 1; 
t = 0:dt:(maxt-dt);
nt = length(t); %length of t 

nCycles = 5; 
amp = 1; 
phase = 0; %with respect to cosign 

% y5 is a sinusoid with 5 cycles
y5 = amp*cos(2*pi*t*nCycles-pi*phase/180); 

% plotting the sinusoid 
figure(1)
clf
plot(t, y5);
xlabel('Time (s)'); 
set(gca, 'XTick', 0:.2:maxt); 
set(gca, 'YTick',-1:1); 
ylabel('Apmlitude'); 
set(gca, 'YLim', amp*1.1*[-1,1]); 

%this draws dotted lines at the x and y-tick values 
grid