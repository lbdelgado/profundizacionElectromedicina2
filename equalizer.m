function [I] = equalizer(I)
%Esta funcion ecualiza una imagen
[m,n]=size(I);

%Adquiere el histograma de la imagen
h=imhist(I);

%Calcula la probabilidad de cada nivel
p=255*h/(m*n);

%Calcula el vector de sumas acumuladas, es decir la transformacion como tal
T=cumsum(p);

for i=1:m
    for j=1:n
        pixel=I(i,j);
        I(i,j)=T(pixel+1);
    end
end
end

