function EI = separableboxfilter(I, dim)
a = (1/ dim) * ones(dim, 1);
 
b = (1/dim) * ones(1, dim);

EI = uint8(conv2(b, (conv2(a, I))));