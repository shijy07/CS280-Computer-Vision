function plot_3d(points,K1,K2,P1,P2)
figure;
N=size(points,1);
for i=1:N
   hold on;
   plot3(points(i,1),points(i,2),points(i,3),'.');
  
end
R1=inv(K1)*P1(:,1:3);
t1=inv(K1)*P1(:,4);
R2=inv(K2)*P2(:,1:3);
t2=inv(K2)*P2(:,4);
C1=-inv(R1)*t1;
C2=-inv(R2)*t2;
hold on;
plot3(C1(1),C1(2),C1(3),'*');
hold on;
plot3(C2(1),C2(2),C2(3),'+');
xlabel('X');
ylabel('Y');
zlabel('Z');
end

