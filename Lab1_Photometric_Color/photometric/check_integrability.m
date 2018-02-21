function [ p, q, SE ] = check_integrability( normals )
%CHECK_INTEGRABILITY check the surface gradient is acceptable
%   normals: normal image
%   p : df / dx
%   q : df / dy
%   SE : Squared Errors of the 2 second derivatives

% initalization
p = zeros(size(normals,1), size(normals,2));
q = zeros(size(normals,1), size(normals,2));
SE = zeros(size(normals,1), size(normals,2));

% ========================================================================
% YOUR CODE GOES HERE
% Compute p and q, where
% p measures value of df / dx
% q measures value of df / dy


% ========================================================================

p(isnan(p)) = 0;
q(isnan(q)) = 0;
for x = 1:size(normals,1)
    for y = 1:size(normals,2)
        p(x,y) = -normals(x,y,1) ./ normals(x,y,3);
        q(x,y) = -normals(x,y,2) ./ normals(x,y,3);
        if (isnan(p(x,y)))
            p(x,y) = 0;
        end
        if (isnan(q(x,y)))
            q(x,y) = 0;
        end
        if (isinf(p(x,y)))
           p(x,y) = 0;
        end
        if (isinf(q(x,y))) 
           q(x,y) = 0; 
        end

    end
end



% ========================================================================
% YOUR CODE GOES HERE
% approximate second derivate by neighbor difference
% and compute the Squared Errors SE of the 2 second derivatives SE
for x = 1:size(normals,1)
    for y = 1:size(normals,2)
        if x ~= 1 && y ~= 1 
            P_Y = p(x,y) - p(x,y-1);
            Q_X = q(x,y) - q(x-1,y);
            SE(x,y) = (P_Y - Q_X)^2;
            if (p(x,y) == -inf)
               d = 1; 
            end
        end
    end
end

% ========================================================================




end

