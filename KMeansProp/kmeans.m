function [means, b, iter] = kmeans(data, num_means,toggletrace)
% Function K-means, receives data as n objects for 2 or 3 given columns (x, y,
% z), and num_means as the number of clusters
 
ndata = length(data(:,1)); % Lenght of the data set (index of objects)
dim = length(data(1,:)); % Dimension of the data set (Characteristics)

axis([-1 8 -1 8 -1 8])

hold on
grid on

if (dim == 2) plot(data(:,1), data(:,2), 'g.'), end % Plot data as 'x' for 2d
if (dim == 3) plot3(data(:,1), data(:,2), data(:,3), 'g.'), end % or 3d
 
means = zeros(num_means, dim); % Prealloc space for mean distances

for n = 1:num_means
  for m = 1:dim
      means(n,m) = unifrnd(min(data(:,m)), max(data(:,m)) ); 
  end % Creates a random initial value for 
end
 
means_old = means;
if (dim == 2) plot(means(:,1), means(:,2), 'b+'); end % Plots initial
                                                      % stochastical guess
if (dim == 3) plot3(means(:,1), means(:,2), means(:,3), 'b+'), end
 
for iter = 1:100 % Up to 100 epochs
    for k = 1:ndata
        dist = EuclideanDist(data(k,:), means(1,:)); % Finds the distance between
                                                % the initial guess and the
                                                % first point
        b(k) = 1; % Flag
        for ii = 2:num_means
            aux = EuclideanDist(data(k,:), means(ii, :));
            if(dist > aux)
               b(k) = ii;
               dist = aux;
            end
        end
    end
   
%     means = zeros(num_means, dim);
    np = zeros(num_means, dim);
 
    for k = 1:ndata % Updates means evaluating  on rows
        n = b(k);
        for m = 1: dim
           means(n,m) = means(n,m) + data(k, m);
           np(n,m) = np(n,m)+1;
        end
    end
 
    for n = 1:num_means % and columns
        for m = 1:dim
            if(np(n,m)~=0)
                means(n,m) = means(n,m)/np(n,m);
            else
                means(n,m) = 0;
            end
        end
    end
 
    if toggletrace == 1
    % Plot the last means calculated
    if (dim == 2) plot(means(:,1), means(:,2), 'ro'), end
    if (dim == 3) plot3(means(:,1), means(:,2), means(:,3),'ro'), end
    end
   
    if (max(max(abs(means_old - means)))<0.01) % Convergence exit
        if (dim == 2) plot(means(:,1), means(:,2), 'k*'), end
        if (dim == 3) plot3(means(:,1), means(:,2), means(:,3),'k*'), end
        break
    end
   
    if toggletrace == 1
    % Plot lines that trace the route of the gradient descent
    for n = 1:num_means
        if (dim == 2) plot([means(n,1), means_old(n,1)],[means(n,2), means_old(n, 2)]), end;
        if (dim == 3) plot3([means(n,1), means_old(n,1)],[means(n,2), means_old(n, 2)],[means(n,3), means_old(n, 3)] ), end;
    end
    end
    
    % Store n-1 data
    means_old = means;
end

iter;