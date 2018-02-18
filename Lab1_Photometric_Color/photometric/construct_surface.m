function [ height_map ] = construct_surface( p, q, path_type )
%CONSTRUCT_SURFACE construct the surface function represented as height_map
%   p : measures value of df / dx
%   q : measures value of df / dy
%   path_type: type of path to construct height_map, either 'column',
%   'row', or 'average'
%   height_map: the reconstructed surface


if nargin == 2
    path_type = 'column';
end

[h, w] = size(p);
height_map = zeros(h, w);

switch path_type
    case 'column'
        % =================================================================
        % YOUR CODE GOES HERE
        % top left corner of height_map is zero
        % for each pixel in the left column of height_map
        %   height_value = previous_height_value + corresponding_q_value
        
        % for each row
        %   for each element of the row except for leftmost
        %       height_value = previous_height_value + corresponding_p_value
      
       for c = 1:size(p,1)
          if c ~= 1 
            height_map(c,1) = height_map(c-1,1) + q(c,1);
          end 
          for r = 2:size(p,2)
              height_map(c,r) = height_map(c,r-1) + p(c,r);
          end
       end
       d = 1
        % =================================================================
               
    case 'row'
        
        % =================================================================
        % YOUR CODE GOES HERE
        

        % =================================================================
          
    case 'average'
        
        % =================================================================
        % YOUR CODE GOES HERE

        
        % =================================================================
end


end

