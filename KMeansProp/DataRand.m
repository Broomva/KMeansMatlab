function [data] = DataRand(N)
for n = 1:N
    if(unifrnd(0,1) > 0.5)
        x(n) = normrnd(2, 0.5);
        y(n) = normrnd(2, 0.5);
        z(n) = normrnd(2, 0.5);
    else
        x(n) = normrnd(5, 0.5);
        y(n) = normrnd(5, 0.5);
        z(n) = normrnd(5, 0.5);
    end;
end
 
data = [x', y', z'];