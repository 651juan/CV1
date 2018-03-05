function [x,y] = findMin(im,kernel, threshold) 
    width = (size(kernel) -1)/2;
    x = [];
    y = [];
    for i = width(1)+1:size(im,1)-width(1)
        for j = width(2)+1:size(im,2)-width(2)
            area = double(im(i-width(1):i+width(1), j-width(2):j+width(2)));
            point = double(im(i,j));
            area(area < point) = 1;
            area(area >= point) = 0;
            if(sum(sum(area)) > 0 && point > threshold) 
                x(end+1) = i;
                y(end+1) = j;
            end
        end
    end
end