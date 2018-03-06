function demo(image)
% Using average because of 6th param
[H,Ix,Iy,y,x] = harris_corner_detector(image, 0, 15, 0.35, 3, 2); 

subplot(1,3,1);
imshow(image) 
title('harris corner detection image rotated 45 degrees');
hold on
plot(y(:), x(:), 'ro');
hold off
image2 = imrotate(image,90);

[H,Ix,Iy,y,x] = harris_corner_detector(image2, 0, 15, 0.35, 3, 2);
subplot(1,3,2);
imshow(image2) 
title('harris corner detection image rotated 90 degrees');

hold on
plot(y(:), x(:), 'ro');
hold off
image2 = imrotate(image,135);

[H,Ix,Iy,y,x] = harris_corner_detector(image2, 0, 15, 0.35, 3, 2);

subplot(1,3,3);
imshow(image2) 
title('harris corner detection image rotated 135 degrees');

hold on
plot(y(:), x(:), 'ro');
hold off
end