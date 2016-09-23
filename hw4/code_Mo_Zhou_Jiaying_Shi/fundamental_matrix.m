function [F, res_err] = fundamental_matrix(matches)
% First normalize the two images to haye zero mean, xnit length

% Compxte T1
x1 = matches(:,1);
y1 = matches(:,2);
x1_mean=mean(x1);
y1_mean=mean(y1);
temp=mean(((x1-x1_mean).^2+(y1-y1_mean).^2).^(1/2));
s=sqrt(2)/temp;
T1=s*[1 0 -temp;0 1 -temp;0 0 1/s];
axx=[x1(:)';y1(:)'; ones(1,length(x1))];
axx= T1*axx;
x1_nor=axx(1,:);
y1_nor=axx(2,:);

% Compxte T2
x2 = matches(:,3);
y2 = matches(:,4);
x2_mean=mean(x2);
y2_mean=mean(y2);
temp=mean(((x2-x2_mean).^2+(y2-y2_mean).^2).^(1/2));
s=sqrt(2)/temp;
T2=s*[1 0 -temp;0 1 -temp;0 0 1/s];
axx=[x2(:)';y2(:)'; ones(1,length(x2))];
axx= T2*axx;
x2_nor=axx(1,:);
y2_nor=axx(2,:);

% Build matrix A
A = zeros(length(y1),9);
for i=1:length(y1)
    A(i,:)=[x1_nor(1,i)*x2_nor(1,i),y1_nor(1,i)*x2_nor(1,i),x2_nor(1,i),x1_nor(1,i)*y2_nor(1,i),y1_nor(1,i)*y2_nor(1,i),y2_nor(1,i),x1_nor(1,i),y1_nor(1,i),1];
end

[U,S,V] = svd(A);

% Then h is the vector in V corresponding to the smallest value in S
f = reshape(V(:,9),3,3)';

% Force it to be rank 2
[U,S,V] = svd(f);
S(3,3)=0;
F_raw = U*S*V';

% Denormalize
F = T2'*F_raw*T1;

% Compute residual
res_err = 0;
for i=1:length(y1)
    x1 = [matches(i,1),matches(i,2),1]';
    x2 = [matches(i,3),matches(i,4),1]';
    err12 = (x1'*F*x2)/norm(F*x2);
    err21 = (x2'*F*x1)/norm(F*x1);
    res_err = res_err + err12^2 + err21^2;
end

res_err = res_err /(2*length(y1));
    

return