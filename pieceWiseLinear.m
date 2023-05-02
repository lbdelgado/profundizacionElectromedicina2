function [I] = pieceWiseLinear(img,points)

    L=length(points(:,1));%Numero de puntos
    row=length(img(:,1));%Filas de la imagen
    col=length(img(1,:));%Columnas de la imagen
    I=zeros(row,col);
    rectas=zeros(L-1,2);

    for i=1:L-1
        [m,b]=recta(points(i,:),points(i+1,:));
        rectas(i,:)=[m,b];%Crea un arreglo de rectas
    end

    for i=1:row
        for j=1:col
            for n=1:L-1
                if (n<L-1)
                    if(img(i,j)>=points(n,1)) && (img(i,j)<points(n+1,1))
                        I(i,j)=img(i,j)*rectas(n,1)+rectas(n,2);
                    end
                else
                    if(img(i,j)>=points(n,1)) && (img(i,j)<=points(n+1,1))
                        I(i,j)=img(i,j)*rectas(n,1)+rectas(n,2);
                    end
                end
            end
        end
    end

    I=uint8(I);
end

