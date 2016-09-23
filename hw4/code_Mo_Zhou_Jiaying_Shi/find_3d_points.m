function [points,rec_err] = find_3d_points(matches,P1,P2)
%Set W=1 and use pseudoinverse to calculate the corresponding 3D points
N=size(matches,1);
%matches N*4 matrix
if (size(matches,2)~=4)
    display('Wrong input dimension...');
    return;
end
rec_err=0;
points=zeros(N,3);
err1=zeros(N,1);
err2=zeros(N,2);
for i=1:N
    A=zeros(4,4);
    A(1,1)=matches(i,1)*P1(3,1)-P1(1,1);
    A(1,2)=matches(i,1)*P1(3,2)-P1(1,2);
    A(1,3)=matches(i,1)*P1(3,3)-P1(1,3);
    A(1,4)=matches(i,1)*P1(3,4)-P1(1,4);
    A(2,1)=matches(i,2)*P1(3,1)-P1(2,1);
    A(2,2)=matches(i,2)*P1(3,2)-P1(2,2);
    A(2,3)=matches(i,2)*P1(3,3)-P1(2,3);
    A(2,4)=matches(i,2)*P1(3,4)-P1(2,4);
    A(3,1)=matches(i,3)*P2(3,1)-P2(1,1);
    A(3,2)=matches(i,3)*P2(3,2)-P2(1,2);
    A(3,3)=matches(i,3)*P2(3,3)-P2(1,3);
    A(3,4)=matches(i,3)*P2(3,3)-P2(1,4);
    A(4,1)=matches(i,4)*P2(3,1)-P2(2,1);
    A(4,2)=matches(i,4)*P2(3,2)-P2(2,2);
    A(4,3)=matches(i,4)*P2(3,3)-P2(2,3);
    A(4,4)=matches(i,4)*P2(3,4)-P2(2,4);
    [U,S,V]=svd(A);
    sv=diag(S);
    indx=find(abs(sv)==min(abs(sv)));
    xn=V(:,indx);
    xn=xn/xn(4);
    x1=P1(1:2,:)*xn/(P1(3,:)*xn);
    x2=P2(1:2,:)*xn/(P2(3,:)*xn);

%%LS
%     A=zeros(6,4);
%     A(1:3,:)=P1(1:3,1:4);
%     A(4:6,:)=P2(1:3,1:4);
%     b=zeros(6,1);
%     b(1,1)=matches(i,1);
%     b(2,1)=matches(i,2);
%      b(3,1)=1;
%     b(4,1)=matches(i,3);
%     b(5,1)=matches(i,4);
%      b(6,1)=1;
%     xn=pinv(A)*b;
%     x1=P1*xn;
%     x2=P2*xn;
    %%

    err1=norm((matches(i,1:2)')-x1(1:2));
    err2=norm((matches(i,3:4)')-x2(1:2));
    points(i,:)=xn(1:3)';
    rec_err=rec_err+err1/2/N+err2/2/N;
end



end

