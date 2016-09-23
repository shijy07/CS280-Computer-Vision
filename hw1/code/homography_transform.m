function v = homography_transform(u,H)
n=size(u,2);
ul=[u;ones(1,n)];
V=H*ul;
v=zeros(2,n);
v(1,:)=V(1,:)./V(3,:);
v(2,:)=V(2,:)./V(3,:);
end

