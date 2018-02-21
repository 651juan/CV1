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
      
%        for lc = 1:size(p,1)
%           if c ~= 1 
%             height_map(c,1) = height_map(c-1,1) + q(c,1);
%           end
%        end
%        for c = 1:size(p,1)
%           for r = 2:size(p,2)
%               height_map(c,r) = height_map(c,r-1) + p(c,r);
%           end
%        end

	for i = 2:h
    		height_value = height_map(i-1,1) + q(i,1);
    		height_map(i,1) = height_value;
	end
        
        % for each row
        %   for each element of the row except for leftmost
        %       height_value = previous_height_value + corresponding_p_value
        
	for i = 1:h
    		for j = 2:w
			height_value = height_map(i,j - 1) + p(i,j);
        		height_map(i,j) = height_value;
    		end
	end

        % =================================================================
               
    case 'row'

        % =================================================================
        % YOUR CODE GOES HERE
%        for r = 1:size(p,2)
%           if r ~= 1 
%             height_map(1,r) = height_map(1,r-1) + q(1,r);
%           end 
%           for c = 2:size(p,1)
%               height_map(c,r) = height_map(c-1,r) + p(c,r);
%           end
%        end
    for j = 2:w
        height_value = height_map(1,j-1) + p(1,j);
        height_map(1,j) = height_value;
	end
	

	for j = 1:w
    		for i = 2:h
			height_value = height_map(i-1,j) + q(i,j);
        		height_map(i,j) = height_value;
    		end
	end


        % =================================================================
          
    case 'average'
  	for i = 2:h
    		height_value = height_map(i-1,1) + q(i,1);
    		height_map(i,1) = height_value;
	end
        
	for i = 1:h
    		for j = 2:w
			height_value = height_map(i,j - 1) + p(i,j);
        		height_map(i,j) = height_value;
    		end
	end
	
	for j = 2:w
    		height_value = height_map(1,j-1) + p(1,j);
		
    		height_map(1,j) = (height_map(1,j) + height_value)/2;
	end
	

	for j = 1:w
    		for i = 2:h
	
			height_value = height_map(i-1,j) + q(i,j);
        		height_map(i,j) = (height_map(i,j) + height_value)/2;
    		end
	end                
        % =================================================================
end


end

