function [ func ] = CORE3sin( X, maxX, minX,  Y, maxY, minY, P1, P2, P3, expAmount)

experAmount = min(size(Y, 1), expAmount);
Ysize = 1;
res = zeros(experAmount, Ysize, 2);

Xtmp = X([1:experAmount],:);
Ytmp = Y([1:experAmount],:);
X = Xtmp;
Y = Ytmp;

X1size = size(X,2);
X2size = 0;
X3size = 0;
Ysize = 1;
XN = X;
for i=1:1:size(X, 2)
    XN(:,i) = normalize(X(:,i), maxX, minX); 
end
YN = Y;
for i=1:1:size(Y, 2)
    YN(:,i) = normalize(Y(:,i), maxY, minY);
end
B = YN;

arcsinhB = asinh(B);
arcsinhYN = asinh(YN);

L = zeros(X1size*P1+X2size*P2+X3size*P3, size(Y, 2));
A = zeros(experAmount, X1size*P1+X2size*P2+X3size*P3);
%AL - B = 0

for i=1:1:experAmount
    for k = 1:1:X1size
         for j=1:1:P1
            A(i,j + (k - 1) * P1) = asinh(polynom3(1,j-1,XN(i,k)));
        end    
    end
    for k = 1:1:X2size
        for j=1:1:P2
            A(i,j + X1size * P1 + (k - 1) * P2) = asinh(polynom3( 1,j-1,XN(i,X1size + k)));
        end
    end
    for k = 1:1:X3size
        for j=1:1:P3
            A(i,j + X1size * P1 + X2size * P2 + (k - 1) * P3) = asinh(polynom3(1, j-1,XN(i, X1size + X2size + k)));
        end
    end
end



    for i = 1:1:Ysize
        L([1:X1size * P1], i) = conjgrad(A(:,[1:X1size * P1])'*A(:,[1:X1size*P1]), A(:,[1:X1size*P1])'*arcsinhB(:,i),L([1:X1size*P1],i));
    end
    for i = 1:1:Ysize
        L([1+X1size*P1:X1size*P1+X2size*P2],i) = conjgrad(A(:,[1+X1size*P1:X1size*P1+X2size*P2])'*A(:,[1+X1size*P1:X1size*P1+X2size*P2]), A(:,[1+X1size*P1:X1size*P1+X2size*P2])'*arcsinhB(:,i),L([1+X1size*P1:X1size*P1+X2size*P2],1));
    end
    for i = 1:1:Ysize
        L([1+X1size*P1+X2size*P2:X1size*P1+X2size*P2+X3size*P3],i) = conjgrad(A(:,[1+X1size*P1+X2size*P2:X1size*P1+X2size*P2+X3size*P3])'*A(:,[1+X1size*P1+X2size*P2:X1size*P1+X2size*P2+X3size*P3]), A(:,[1+X1size*P1+X2size*P2:X1size*P1+X2size*P2+X3size*P3])'*arcsinhB(:,i),L([1+X1size*P1+X2size*P2:X1size*P1+X2size*P2+X3size*P3],1));
    end

arcsinhPSI = zeros (experAmount, X1size + X2size + X3size,Ysize);

for i=1:1:experAmount
    for l = 1:1:X1size
        for f = 1:1:Ysize
            for j=1:1:P1
                arcsinhPSI(i,l,f) = arcsinhPSI(i,l,f) + L(j + (l - 1) * P1,f)*asinh(polynom3(1,j-1,XN(i,l)));
            end
        end
    end
    for l = X1size+1:1:X1size+X2size
        for f = 1:1:Ysize
            for j=1:1:P2
                arcsinhPSI(i,l,f) = arcsinhPSI(i,l,f) + L(j + X1size * P1 + (l - X1size - 1) * P2,f)*asinh(polynom3(1,j-1,XN(i,l)));
            end
        end
    end
    for l = X1size+X2size+1:1:X1size+X2size+X3size
        for f = 1:1:Ysize
            for j=1:1:P3
                arcsinhPSI(i,l,f) = arcsinhPSI(i,l,f) + L(j + X1size * P1 + X2size * P2 + (l - X2size - X1size - 1) * P3,f)*asinh(polynom3(1,j-1,XN(i,l)));
            end
        end
    end
end

%6 stage
AMatrix = zeros(X1size+X2size+X3size,Ysize);

for i = 1:Ysize
    arcsinhPSIxtr = arcsinhPSI(:,[1:X1size],i);
    AMatrix([1:X1size],i) = conjgrad(arcsinhPSIxtr'*arcsinhPSIxtr, arcsinhPSIxtr'*arcsinhYN(:,i),AMatrix([1:X1size],i));
    arcsinhPSIxtr = arcsinhPSI(:,[X1size + 1:X1size + X2size],i);
    AMatrix([X1size + 1:X1size + X2size],i) = conjgrad(arcsinhPSIxtr'*arcsinhPSIxtr, arcsinhPSIxtr'*arcsinhYN(:,i),AMatrix([X1size + 1:X1size + X2size],i));
    arcsinhPSIxtr = arcsinhPSI(:,[X2size + X1size + 1:X1size + X2size + X3size],i);
    AMatrix([X2size + X1size + 1:X1size + X2size + X3size],i) = conjgrad(arcsinhPSIxtr'*arcsinhPSIxtr, arcsinhPSIxtr'*arcsinhYN(:,i),AMatrix([X2size + X1size + 1:X1size + X2size + X3size],i));
end

arcsinhPHITMP = zeros(experAmount,3,Ysize);
for j = 1:1:Ysize
    for i=1:1:experAmount
        % j=1
        arcsinhPHITMP(i,1,j) = PHIhrdsin(1, AMatrix([1:X1size],j), L([1:X1size*P1],j), XN(i,[1:X1size]));
        % j=2
        arcsinhPHITMP(i,2,j) = PHIhrdsin(1, AMatrix([1+X1size:X1size+X2size],j), L([X1size*P1+1:X1size*P1+X2size*P2],j), XN(i,[1+X1size:X1size+X2size]));
        % j=3
        arcsinhPHITMP(i,3,j) = PHIhrdsin(1, AMatrix([1+X1size+X2size:X1size+X2size+X3size],j), L([X1size*P1+X2size*P2+1:X1size*P1+X2size*P2+X3size*P3],j), XN(i,[1+X1size+X2size:X1size+X2size+X3size]));
    end

end



CMatrix = zeros(3,Ysize);
for i = 1:1:Ysize
    arcsinhPHIxtr = arcsinhPHITMP(:,:,i);
    CMatrix(:,i) = conjgrad(arcsinhPHIxtr'*arcsinhPHIxtr, arcsinhPHIxtr'*arcsinhYN(:,i),CMatrix(:,i));
end

ERROR = zeros(experAmount,Ysize);


for i=1:1:experAmount
    for j=1:1:Ysize
        tmp = sinh(CMatrix(1,j)*arcsinhPHITMP(i,1,j) + CMatrix(2,j)*arcsinhPHITMP(i,2,j) + CMatrix(3,j)*arcsinhPHITMP(i,3,j));
        ERROR(i,j) = abs(YN(i,j) - tmp);
        res(i,j,2) = tmp;        
        res(i,j,3)=ERROR(i,j);
    end
end

func = @(newX)PHIhrdsin(2, AMatrix([1:X1size],1), L([1:X1size*P1],4), newX);


