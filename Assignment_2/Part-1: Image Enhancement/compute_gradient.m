function [Gx, Gy, im_magnitude,im_direction] = compute_gradient(image)
kernelx = [[1,0,-1],[2,0,-2],[1,0,-1]];
kernely = [[1,2,1],[0,0,0],[-1,-2,-1]];

Gx = zeros(size(image));
Gy = zeros(size(image));

for x = 2:size(image,1)
   for y = 2:size(image,2)
       
   end
end
end

