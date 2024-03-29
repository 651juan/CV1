function [ albedo, normal ] = estimate_alb_nrm_color( image_stack, scriptV)
%COMPUTE_SURFACE_GRADIENT compute the gradient of the surface
%   image_stack : the images of the desired surface stacked up on the 3rd
%   dimension
%   scriptV : matrix V (in the algorithm) of source and camera information
%   shadow_trick: (true/false) whether or not to use shadow trick in solving
%   	linear equations
%   albedo : the surface albedo
%   normal : the surface normal


[h, w, ~] = size(image_stack);


% create arrays for 
%   albedo (1 channel)
%   normal (3 channels)
albedo = zeros(h, w, 3);
normal = zeros(h, w, 3);

% =========================================================================
% YOUR CODE GOES HERE
% for each point in the image array
%   stack image values into a vector i
%   construct the diagonal matrix scriptI
%   solve scriptI * scriptV * g = scriptI * i to obtain g for this point
%   albedo at this point is |g|
%   normal at this point is g / |g|
for x = 1:w
    for y = 1:h
        shape = size(image_stack(x,y,:));

        i1 = double(reshape(image_stack(x,y,1:3:shape(3)), shape(3)/3, 1));
		i2 = double(reshape(image_stack(x,y,2:3:shape(3)), shape(3)/3, 1));
		i3 = double(reshape(image_stack(x,y,3:3:shape(3)), shape(3)/3, 1));
        
        scriptI1 = diag(i1);
        scriptI2 = diag(i2);
        scriptI3 = diag(i3);


        [g, ~] = linsolve((scriptI1 * scriptV(1:3:end,:)), (scriptI1 * i1));
        albedo1 = norm(g);
        if norm(g) ~= 0 
            normal1 = g / albedo1;
        else 
            normal1 = g;
        end

        [g, ~] = linsolve((scriptI2 * scriptV(2:3:end,:)), (scriptI2 * i2));
        albedo2 = norm(g);
        if norm(g) ~= 0 
            normal2 = g / albedo2;
        else 
            normal2 = g;
        end

        [g, ~] = linsolve((scriptI3 * scriptV(3:3:end,:)), (scriptI3 * i3));
        albedo3 = norm(g);
        if norm(g) ~= 0 
            normal3 = g / albedo3;
        else 
            normal3 = g;
        end

        normal(x,y,:) = (normal1+normal2+normal3)/3;
        albedo(x,y,:) = [albedo1 albedo2 albedo3];
        if (x == 261 && y == 444)
           d = 1 ;
        end
    end
end



% =========================================================================

end
