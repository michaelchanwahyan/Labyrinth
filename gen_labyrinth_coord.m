close all
clear
clc

img = rgb2gray(imread('labyrinth.png'));
img = img(3:806,:,:);
img = img > 250 ;
img = imresize(img,0.125);

img = 1 * img;

img = [ ones(size(img,1),floor(0.1*size(img,2))) , ...
        img , ones(size(img,1),floor(0.1*size(img,2))) ];
img = [ ones(floor(0.1*size(img,1)),size(img,2)) ; ...
        img ; ones(floor(0.1*size(img,1)),size(img,2)) ];

fid = fopen('labyrinth.txt','w');

for i = 1 : size(img,1)
    for j = 1 : size(img,2)
        if (img(i,j) == 0)
            fprintf(fid, '(i,j)=(%d,%d) true\n',i,j);
        end
    end
end
clear i j
fclose(fid);
csvwrite('labyrinth.csv',img);

figure ; imshow(img);
