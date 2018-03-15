%% Class Exercises 6

%% Q 6.1 Lightness Constancy 

[X, Y] = meshgrid(linspace(-1, 1, 101)); % why does only 101 work??
X(30:40, 10:90) = 0.1; 
X(60:70, 10:90) = 0.8; 

figure(1)
imagesc(X);
colormap(gray(256))

figure(2)
image(1)
imagesc(X);
colormap(hsv(256))

%% Q 6.2

%variables in mesh
num_seg = 6;
radius = 0.7;

[X,Y] = meshgrid(linspace(-1, 1, 701));


% segment pattern
theta = atan2(Y, X)./pi;
theta = mod(theta*num_seg, 1); 

figure(1) 
radiusimage = sqrt(X.^2+Y.^2);
apeture = NaN(size(radiusimage)); 
apeture(radiusimage<radius) = 1; 
apeture(radiusimage>=radius)=0;

spiral = theta.*apeture; 
imagesc(spiral); 

colormap(gray(256))

figure(2)
theta = max(theta(:))-theta;
radiusimage = sqrt(X.^2+Y.^2);
apeture = NaN(size(radiusimage)); 
apeture(radiusimage<radius) = 1; 
apeture(radiusimage>=radius)=0;

spiral = theta.*apeture; 
imagesc(spiral); 

colormap(gray(256))