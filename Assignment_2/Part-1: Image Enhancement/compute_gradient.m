function [Gx, Gy, im_magnitude, im_direction] = compute_gradient(image)
kernelx = [1,0,-1;2,0,-2;1,0,-1];
kernely = [1,2,1;0,0,0;-1,-2,-1];

Gx = conv(image,kernelx);
Gy = conv(image,kernely);
im_magnitude = sqrt(Gx.^2+Gy.^2);
im_direction = atand(Gy./Gx);

end
