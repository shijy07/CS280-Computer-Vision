function [s,phi] = rot_to_ax_phi(R)
%base on part5 we can use cos(phi)=0.5(trace(R)-1) 
phi=acos(0.5*trace(R)-0.5);
[v,d]=eig(R);
for i=1:3
    if (d(i,i)>=0.99999)&&(d(i,i)<=1.0001)
        s=v(:,i)/norm(v(:,i));
    end        
end
end
