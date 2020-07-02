clc, clear, close all

% K-means eval for a random dataset
data = DataRand(1000); % DataRand(n) n->number of objects
x = data(1,:);  y = data(2,:);  z = data(3,:);
k = 2;
trace = 0;
[means, b, iter] = kmeans(data, k,trace); % Evals the dataset with a guess of k classes
% trace toggles all the route the algorithm creates
% Function plots the data in green dots, the initial centroid guess as a
% blue +, and the final data as a black *.

% Note that iter value changes with each execute, since all the data being
% used is randomly generated. Furthermore, the routes and the convergences
% do not always shows the intuitive & logical route one would take, but
% this is part of the beauty inside the stochastical approach
