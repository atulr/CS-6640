function M = templatematching(I, PI)
dim1 = size(PI, 1);
dim2 = size(PI, 2);
a = (dim1 - 1)/2;
b = (dim2 - 1)/2;
acc = 0.0;
acc1 = 0.0;
diff = 0.0;
diff1 = 0.0;
M = double(zeros(size(I,1), size(I, 2)));
% PI = double(PI);
% mx = 0.0;
maskavg = double(mean(mean(mean(PI))));
% mx = double(max(max(PI)));
% PI = double(PI/mx);
offset1 = (size(PI, 1) + 1)/2;
offset2 = (size(PI, 2) + 1)/2;
for i=0:size(I,1) - offset1
    for j=0:size(I, 2) - offset2
        if ( (j + dim1 + offset2 <= size(I, 2)) && (i  + offset1 + dim2 <= size(I, 1)) && (i+1+dim1 <= size(I, 1)) && (j+ 1+ dim2 <= size(I,2)))
            imageavg = double(mean(mean(mean(I(i+1:i+1+dim1, j+1:j+1+dim2)))));
        end
        for m=-a:a
            for n=-b:b
                if ( (j + n + offset1 <= size(I, 2)) && (i + m + offset1 <= size(I, 1)))
                    diff = double(PI(m + offset1, n + offset2)- maskavg);
                    diff1 = double(I(i + (m + offset1), j + (n + offset2)) - imageavg);
%                     disp('diff');
%                     disp(diff);
%                     disp('diff1');
%                     disp(diff1);
                    acc = acc + (diff1 * diff);
%                     acc1 = double(acc1 + double(sqrt(double(diff*diff*diff1*diff1))));
                end
            end                                  
        end
%         M(i + offset1, j + offset2) = double(acc/acc1);
        M(i+offset1, j+offset2) = acc;
        acc = 0.0;
        acc1 = 0.0;
    end
end

mx = max(max(M));
M = M/mx;
M = M * 255;
M = uint8(M);