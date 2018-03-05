function res
image = imread('pingpong/0000.jpeg');
image2 = imrotate(image,45);
[H,Ix,Iy,y,x] = harris_corner_detector(image2, 3.524088152432112e+07/5 , 15,0.35, 3 ); 

subplot(1,3,1);
imshow(image2) 
title('harris corner detection image rotated 45 degrees');
hold on
plot(y(:), x(:), 'ro');
hold off
image2 = imrotate(image,90);

[H,Ix,Iy,y,x] = harris_corner_detector( image2, 3.524088152432112e+07/5, 15,0.35, 3 );

subplot(1,3,2);
imshow(image2) 
title('harris corner detection image rotated 90 degrees');

hold on
plot(y(:), x(:), 'ro');
hold off
image2 = imrotate(image,135);

[H,Ix,Iy,y,x] = harris_corner_detector( image2, 3.524088152432112e+07/5, 15,0.35, 3 );

subplot(1,3,3);
imshow(image2) 
title('harris corner detection image rotated 135 degrees');

hold on
plot(y(:), x(:), 'ro');
hold off


% C = corner(rgb2gray(image));
% imshow(image);
% hold on
% plot(C(:,1), C(:,2), 'r*');
end