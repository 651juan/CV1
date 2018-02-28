function G = gauss2D( sigma , kernel_size )
    %% solution
     
    %kernel_size should be like [3,5]?
    kernel_size_x = kernel_size(1);
    kernel_size_y = kernel_size(2);
 
     
    G = transpose(gauss1D( sigma , kernel_size_x )) .* gauss1D( sigma , kernel_size_y );
end