function [ imOut ] = denoise( image, kernel_type, varargin)

switch kernel_type
    case 'box'
        imOut = imboxfilt(image, varargin{1});
    case 'median'
        imOut = medfilt2(image);
    case 'gaussian'
        fprintf('Not implemented\n')
end
end
