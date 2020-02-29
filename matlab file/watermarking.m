function [inmageSNR]=watermarking[imag]
x=double(imag);
y=x;	
a=zeros(300,500);
a(100:250,100:250)=1;
%save m.dat a -ascii;
m=a;
x1= x(:,:,1);
x2= x(:,:,2);
x3= x(:,:,3);

dx1 =dct2(x1);  dx11=dx1;
dx2 =dct2(x2);	dx22=dx2;
dx3 =dct2(x3);  dx33=dx3;
load m.dat
g=10;
[rm,cm]=size (m);
dx1(1:rm,1:cm)=dx1(1:rm,1:cm)+g*m;
dx2(1:rm,1:cm)=dx2(1:rm,1:cm)+g*m;
dx3(1:rm,1:cm)=dx3(1:rm,1:cm)+g*m;
y1=idct2(dx1);
y2=idct2(dx2);
y3=idct2(dx3);
y(:,:,1)=y1;
y(:,:,2)=y2;
y(:,:,3)=y3;

z=y;
dy1 =dct2(y1);	
dy2 =dct2(y2);	
dy3 =dct2(y3);  
imageSNR=snr(x,y)
end
