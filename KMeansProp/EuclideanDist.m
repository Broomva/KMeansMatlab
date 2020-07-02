function d = EuclideanDist(dx, mean)
d = 0;
n = length(dx);
for k = 1: n
    d = d + (dx(k) - mean(k))^2;
end
d = d^0.5;