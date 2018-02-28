function imOut = compute_LoG(image, LOG_type, varargin)

switch LOG_type
    case 1
        %method 1
        smooth = denoise(image,'gaussian', 0.5,[5,5]);
        imOut = diff(smooth,2);

    case 2
        %method 2
        kernel = fspecial('log',[5,5],0.5);
        imOut = conv(image,kernel);

    case 3
        %method 3
        smooth1 = denoise(image,'gaussian', varargin{1},[5,5]);
        smooth2 = denoise(image,'gaussian', varargin{2},[5,5]);
        imOut = smooth1 - smooth2;
end
end

