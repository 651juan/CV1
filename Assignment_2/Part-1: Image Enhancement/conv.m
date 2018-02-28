function output = conv(im,kernel) 
    width = (size(kernel) -1)/2;

    output = zeros(size(im));

    for i = width(1)+1:size(im,1)-width(1)
        for j = width(2)+1:size(im,2)-width(2)
            area = double(im(i-width(1):i+width(1), j-width(2):j+width(2)));
            output(i,j) = sum(sum(area.*kernel));
        end
    end
end