function [I] = equalizer(I)
% %Esta funcion ecualiza una imagen
% [m,n]=size(I);
% 
% %Adquiere el histograma de la imagen
% h=imhist(I);
% 
% %Calcula la probabilidad de cada nivel
% p=255*h/(m*n);
% 
% %Calcula el vector de sumas acumuladas, es decir la transformacion como tal
% T=cumsum(p);
% 
% for i=1:m
%     for j=1:n
%         pixel=I(i,j);
%         I(i,j)=T(pixel+1);
%     end
% end


H=imhist(I);
H=H';
suma=H(1,1);
[N,M]=size(I);
G=zeros(N,M);

for k=1:255  % rango del histograma
    H2(1,k)=suma;
    suma=suma+H(1,k+1);    
end
plot(H2)

np=N*M; % Número total de pixeles
poc=double(H2./np); % valor entre 0 y 1
cdf=double(round(poc.*255)); % 255 es lk
plot(cdf)

for i=1:N
    for j=1:M
        b=I(i,j);
        if b==0
            b=1;
        end
        G(i,j)=cdf(1,b);
    end
end
I=uint8(G);
end
