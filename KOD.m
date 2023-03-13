
imageorj=imread('C:\Users\USER\Desktop\resim1.PNG');%Resmimizi okuyoruz.figure(1)
imshow(imageorj);
image=rgb2gray(imageorj); %Resmimizi gri tona �eviriyoruz.(2-Boyut)
level=graythresh(image);
bw=im2bw(image,level);figure(2)
imshow(bw);
bw=imcomplement(bw); %Resmi negatiflik ekliyoruz.figure(3)
imshow(bw);
bw=imfill(bw,'holes');%Resimde �ukur diye nitelendirilen yerleri dolduruyoruz.
bw = bwareaopen(bw,30);%30px den daha az say�da olan nesneler kald�r�l�yor. figure(4)
imshow(bw);
se=strel('disk',11); %Yar��ap� 11px olan disk bi�iminde yap�sal element olu�turuyoruz.
bw2=imerode(bw,se); %Birlesik madeni paralarin ayrilmasi saglaniyor.figure(5)
imshow(bw2);
[B,L] = bwboundaries(bw2);  
% length(B) ile para adetini ogrendik ve etiket atadik
stats = regionprops(bw2, 'Area','Centroid');
imshow(imageorj);    
toplam = 0;   
 for n=1:length(B)        
a=stats(n).Area;  % Her paran�n alan�n� ��rendik. Boyutlara g�re hesaplama yapt�k.         
centroid=stats(n).Centroid;            
if a> 1200                 
toplam = toplam + 1;                 
text(centroid(1),centroid(2),'1TL');            
elseif a >800 &&  a < 1050                
toplam = toplam + 0.5;               
text(centroid(1),centroid(2),'50Kr');           
elseif a >500 &&  a < 650                
toplam = toplam + 0.25;                
text(centroid(1),centroid(2),'25Kr');            
elseif a > 360 &&  a < 380                
toplam = toplam + 0.10;                
text(centroid(1),centroid(2),'10Kr');            
else                 
toplam = toplam + 0.05;                 
text(centroid(1),centroid(2),'5Kr');        
end    
end         
title(['Toplam para miktari = ',num2str(toplam),' TL'])