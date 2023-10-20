clc; 
clear all;
s=zeros(9,2);
s(1:6,1)=0.5;
s(9,1)=1;
s(7,2)=1.5;
s(8,2)=1.5;
s(9,2)=1;
for i=1:2
 [t,x]=ode23s(@(t,x)rfmnp_pool_3(t,x),[0 100],s(:,i));
 figure;
plot(t,x(:,1));
hold on;
plot(t,x(:,2));
plot(t,x(:,3));
plot(t,x(:,4));
plot(t,x(:,5));
plot(t,x(:,6));
plot(t,x(:,7));
plot(t,x(:,8));
plot(t,x(:,9));
end