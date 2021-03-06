function val = rbf(X, Xi)
sigma = 10.5;
sigmaSQ = power(sigma, 2);
dist = power((X(1,1) - Xi(1, 1)), 2) + power((X(2, 1) - Xi(2, 1)), 1);

val = double(exp(-0.5 * (abs(dist)/sigmaSQ)));

