function [ PSNR ] = myPSNR( orig_image, approx_image )
    doubleImage = im2double(orig_image);
    doubleapprox = im2double(approx_image);
    MSE = 0;
    maxOrig = 0;
    for x = 1:size(doubleImage,1)
       for y = 1:size(doubleImage,2) 
           if (doubleImage(x,y) > maxOrig)
              maxOrig = doubleImage(x,y); 
           end
           MSE = MSE + (doubleImage(x,y) - doubleapprox(x,y))^2;
       end
    end
    MSE = MSE/(size(doubleImage,1) * size(doubleImage,2));
    PSNR = 20 * log10(maxOrig/sqrt(MSE));
end 

