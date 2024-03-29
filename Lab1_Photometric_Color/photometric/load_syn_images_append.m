function [ image_stack, scriptV ] = load_syn_images_append( image_dir )
%LOAD_SYN_IMAGES read from directory image_dir all files with extension png
%   image_dir: path to the image directory
%   nchannel: the image channel to be loaded, default = 1
%
%   image_stack: all images stacked along the 3rd channel
%   scriptV: light directions

files = dir(fullfile(image_dir, '*.png'));
nfiles = length(files);


image_stack = 0;
V = 0;
Z = 0.5;

for i = 0:nfiles-1

    % read input image
    im = imread(fullfile(image_dir, files(i+1).name));
    im1 = im(:, :, 1);
    im2 = im(:, :, 2);
    im3 = im(:, :, 3);

    % stack at third dimension
    if image_stack == 0
        [h, w, c] = size(im);
        fprintf('Image size (HxW): %dx%d\n', h, w);
        image_stack = zeros(h, w, nfiles*3, 'uint8');
        V = zeros(nfiles*3, 3, 'double');
    end
    image_stack(:, :, (i*3)+1) = im1;
    image_stack(:, :, (i*3)+2) = im2;
    image_stack(:, :, (i*3)+3) = im3;

    % read light direction from image name
    name = files(i+1).name(8:end);
    m = strfind(name,'_')-1;
    X = str2double(name(1:m));
    n = strfind(name,'.png')-1;
    Y = str2double(name(m+2:n));
    V((i*3)+1, :) = [X, Y, Z];
    V((i*3)+2, :) = [X, Y, Z];
    V((i*3)+3, :) = [X, Y, Z];

end

% normalization
min_val = double(min(image_stack(:)));
max_val = double(max(image_stack(:)));
image_stack = (double(image_stack) - min_val) / (max_val - min_val);

normV = sqrt(sum(V.^2, 2));
scriptV = bsxfun(@rdivide, V, normV);

end

