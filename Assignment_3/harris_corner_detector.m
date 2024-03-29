% If there is the 6th input is available the threshold is set to the
% average of H times  the averageThresholdMultiplier.
function [H,Ix,Iy, y, x] = harris_corner_detector(image, thres, dim, grad, dimkern, averageThresholdMultiplier)
gray = rgb2gray(image);
[Ix, Iy, im_magnitude, im_direction] = compute_gradient(gray);
gaussian = gauss2D(grad,[dimkern,3]);
A = conv(Ix.^2,gaussian);
C = conv(Iy.^2,gaussian);
B = conv(Ix.*Iy,gaussian);

Q = [A,B;B,C];
H = (A.*C - B.^2) - 0.04*(A+C).^2;    
avg_r = mean(mean(H));
if nargin == 6
    [x,y] = findMin(H, zeros(dim,dim), abs(averageThresholdMultiplier*avg_r));
else 
    [x,y] = findMin(H, zeros(dim,dim), thres);
end
Ix = Ix./255;
Iy = Iy./255;
end