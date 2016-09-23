function [R t_all] = find_rotation_translation(E)
% carry out SVD for E
[U,S,V] = svd(E);

t = U(:,3);
W = [0,-1,0;1,0,0;0,0,1];
R1 = U*W*V';
R2 = U*W'*V';

x = linspace(220,240,101);
R = {(-1)*R1,(-1)*R2};

t_all = cell(200,1);
for i=1:100
    t_all{i} = x(i+1)*t;
end

for i=1:100
    t_all{i+100} = (-1)*x(i+1)*t;
end


return


