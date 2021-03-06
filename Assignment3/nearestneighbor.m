function NNI = nearestneighbor(I)
theta = 30.0;
RI = rotation(I);
rotMat = [cosd(theta) sind(theta) 0; -sind(theta) cosd(theta) 0; 0 0 1];
rotMatInv = inv(rotMat);
NNI = zeros(size(RI,1), size(RI, 2));

for i=1:size(RI,1)
    for j = 1:size(RI, 2)
        posMat = [i j 1];
        reversePosMat = rotMatInv * posMat';
        x = ceil(abs(reversePosMat(1, 1)));
        y = ceil(abs(reversePosMat(2,1)));
        if(x > 0 && y > 0 && x < size(I,1) && y < size(I, 2))
            NNI(i, j) = I(x, y);
        end
    end
end

