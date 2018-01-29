% random tight rope walk
nsteps = 20;
timepts = 0:0.1:2;

forwardspeed = .03;
noise = 0.8;
stepsize=5; 

footposition(1)= 0;
for i=2:length(timepts)
    footposition(i) = footposition(i-1) + ...
                      forwardspeed + ...
                      (noise * rand(1, 1));
                  
                  if footposition(i) >- stepsize
                      footposition(i: length(timepoints))=NaN;
                      i=length(timepoints)+1
                  end
                      
end 
plot(footposition)