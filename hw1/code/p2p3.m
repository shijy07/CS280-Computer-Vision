%%
%CS270 HW1
%2.3
%Jiaying Shi
%SID:24978491
%shijy07@berkeley.edu
%%
phi=[0, pi/12,pi/8,pi/6,pi/4,pi/2,pi,1.5*pi];
n=length(phi);
s=rand(3,1)-0.5;
s=s/norm(s);
S=[0 -1*s(3) s(2);s(3) 0 -1*s(1); -1*s(2) s(1) 0];
v=rand(3,1)-0.5;
v=v/norm(v);
figure;
quiver3(0,0,0,s(1),s(2),s(3));
hold on;
quiver3(0,0,0,v(1),v(2),v(3));
hold on;
for i=1:n
    R=eye(3)+sin(phi(i))*S+(1-cos(phi(i)))*S*S;
    u=R*v;
    quiver3(0,0,0,u(1),u(2),u(3));
    stri=num2str(i);
    strl=['u',stri];
    legend(strl);
    hold on;
end
legend('s','v','u1','u2',...
    'u3','u4','u5','u6','u7','u8');

hold off;
axis equal;