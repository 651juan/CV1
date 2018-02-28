% input_image = imread('images/image1.jpg');
% salt_image = imread('images/image1_saltpepper.jpg');
% gaussian_image = imread('images/image1_gaussian.jpg');
% disp(myPSNR(input_image,salt_image))
% 
% box3 = denoise(gaussian_image,'box',3);
% box5 = denoise(gaussian_image,'box',5);
% box7 = denoise(gaussian_image,'box',25);
% disp(myPSNR(input_image,box3))
% disp(myPSNR(input_image,box5))
% disp(myPSNR(input_image,box7))
% 
% subplot(2,2,1) 
% imshow(gaussian_image);
% title('Input image') 
% 
% subplot(2,2,2) 
% imshow(uint8(box3));
% title('0.5 σ') 
% 
% subplot(2,2,3) 
% imshow(uint8(box5));
% title('1 σ') 
% 
% subplot(2,2,4) 
% imshow(uint8(box7));
% title('2 σ') 

% input_image = imread('images/image2.jpg');
% [x,y,mag,dir] = compute_gradient(input_image);
% 
% x = x./255;
% y = y./255;
% [rmag, rdir] = imgradient(input_image);
% 
% subplot(2,2,1)
% imshow(x);
% title('The gradient of the image in the x-direction.');
% 
% subplot(2,2,2)
% imshow(y);
% title('The gradient of the image in the y-direction.');
% 
% subplot(2,2,3)
% imshow(mag, []);
% title('The gradient magnitude of each pixel.');
% 
% subplot(2,2,4)
% imshow(rdir, []);
% title('The gradient direction of each pixel.');



input_image = imread('images/image2.jpg');

out1 = compute_LoG(input_image,3,0.5,0.6);
out3 = compute_LoG(input_image,3,0.5,1.5);
out2 = compute_LoG(input_image,3,0.5,0.8);

% out1 = out1 ./max(max(out1));
% out2 = out2 ./max(max(out2));
% out3 = out3 ./max(max(out3));

subplot(2,2,1)
imshow(input_image);
title('Original Image');

subplot(2,2,2)
imshow(out1);
title('1:1.1');

subplot(2,2,3);
imshow(out2);
title('1:1.6');

subplot(2,2,4);
imshow(out3);
title('1:2');
