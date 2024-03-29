function [ albedo, normal ] = estimate_alb_nrm( image_stack, scriptV, shadow_trick)
%COMPUTE_SURFACE_GRADIENT compute the gradient of the surface
%   image_stack : the images of the desired surface stacked up on the 3rd
%   dimension
%   scriptV : matrix V (in the algorithm) of source and camera information
%   shadow_trick: (true/false) whether or not to use shadow trick in solving
%   	linear equations
%   albedo : the surface albedo
%   normal : the surface normal


[h, w, ~] = size(image_stack);
if nargin == 2
    shadow_trick = true;
end

% create arrays for 
%   albedo (1 channel)
%   normal (3 channels)
albedo = zeros(h, w, 1);
normal = zeros(h, w, 3);

% =========================================================================
% YOUR CODE GOES HERE
% for each point in the image array
%   stack image values into a vector i
%   construct the diagonal matrix scriptI
%   solve scriptI * scriptV * g = scriptI * i to obtain g for this point
%   albedo at this point is |g|
%   normal at this point is g / |g|
for x = 1:size(image_stack,1)
    for y = 1:size(image_stack,2)
        i = zeros(1,size(image_stack,3));
        for n = 1:size(image_stack,3)
           i(n) = image_stack(x,y,n);
        end
        if shadow_trick
            scriptI = diag(i);
            [g, ~] = linsolve((scriptI * scriptV), (scriptI * i'));
        else 
            [g, ~] = linsolve(scriptV, i');
        end
        albedo(x,y) = norm(g);
        if norm(g) ~= 0 
            normal(x,y,:) = g / albedo(x,y);
        else 
            normal(x,y,:) = g;
        end
    end
end


% =========================================================================

end
