function H = homography_solve(u,v)
H=zeros(3,3);
b=zeros(8,1);
b(1)=v(1,1);b(2)=v(2,1);
b(3)=v(1,2);b(4)=v(2,2);
b(5)=v(1,3);b(6)=v(2,3);
b(7)=v(1,4);b(8)=v(2,4);
A=zeros(8,8);
for i=1:4
    A((i-1)*2+1,1:3)=[u(:,i)' 1];
    A(2*i,4:6)=[u(:,i)' 1];
    A((i-1)*2+1,7:8)=-1*v(1,i)*u(:,i)';
    A(i*2,7:8)=-1*v(2,i)*u(:,i)';
end
x=A\b;
H(1,1)=x(1);
H(1,2)=x(2);
H(1,3)=x(3);
H(2,1)=x(4);
H(2,2)=x(5);
H(2,3)=x(6);
H(3,1)=x(7);
H(3,2)=x(8);
H(3,3)=1;