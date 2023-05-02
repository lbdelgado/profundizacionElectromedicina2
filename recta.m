function [m,b] = recta(p1,p2)
m=(p2(2)-p1(1))/(p2(1)-p1(1));
b=p1(2)-m*p1(1);
end

