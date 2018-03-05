function G = gauss1D( sigma , kernel_size )
    %G = zeros(1, kernel_size);
    if mod(kernel_size, 2) == 0
        error('kernel_size must be odd, otherwise the filter will not have a center to convolve on')
    end
    %% solution
     
    k = floor(kernel_size/2);
    G = linspace(-k,k,kernel_size);
    G = 1/(sigma * sqrt(2*pi)) * exp(- G.^2 / (2*sigma^2));
    s = sum(G);
     
    G = G./ s;
 
end
