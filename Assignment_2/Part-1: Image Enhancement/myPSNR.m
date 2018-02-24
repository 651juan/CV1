function [ PSNR ] = myPSNR( orig_image, approx_image )
    MSE = 0;
    maxOrig = 0;
    for x = 1:size(orig_image,1)
       for y = 1:size(orig_image,2) 
           if (orig_image(x,y) > maxOrig)
              maxOrig = orig_image(x,y); 
           end
           MSE = MSE + (double(orig_image(x,y)) - double(approx_image(x,y)))^2;
       end
    end
    MSE = MSE/(size(orig_image,1) * size(orig_image,2));
    PSNR = 20 * log10(double(maxOrig/sqrt(double(MSE))));
end 

