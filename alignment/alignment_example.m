I1=imread('./Datasets/Kuwait/2015_02.jpg');
I1= google_delete(I1);
I2=imread('./Datasets/Kuwait/2017_02.jpg');
I2= google_delete(I2);
I3=alignment(I1,I2);
figure(2)
subplot(2,2,1),imshow(I1);
subplot(2,2,2),imshow(I2);
subplot(2,2,3),imshow(I3);