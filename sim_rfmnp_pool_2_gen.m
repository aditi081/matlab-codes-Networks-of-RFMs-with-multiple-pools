%%%%%%%%%Monte Carlo Simulation with parallel update.
%%%%%%A Network having four RFMs and two pools. 
%%%Can be modified for two RFMs and two pools.
clc;
clear all;
tic
n_1=10;
n_2=5;
n_3=4;
n_4=15;
count=0;
timesteps=6*(10^5);
k=0.01;    %step size
z_1=3;
z_2=2;
lambda_0_1=1;
lambda_0_2=1;
lambda_0_3=1;
lambda_0_4=1;
lambda_1=zeros(n_1,1);   %%%rates
lambda_2=zeros(n_2,1);
lambda_3=zeros(n_3,1);
lambda_4=zeros(n_4,1);
r_1=zeros(n_1,1);
r_2=zeros(n_2,1);
r_3=zeros(n_3,1);
r_4=zeros(n_4,1);
r_1_0=max(k,exprnd(lambda_0_1*(1/z_1)));  %%%Initiation rate incorporating pool variable
   r_1_0=ceil(r_1_0/k)*k;
   r_2_0=max(k,exprnd(lambda_0_2*(1/z_1)));
   r_2_0=ceil(r_2_0/k)*k;
    r_3_0=max(k,exprnd(lambda_0_3*(1/z_2)));
   r_3_0=ceil(r_3_0/k)*k;
    r_4_0=max(k,exprnd(lambda_0_4*(1/z_2)));
   r_4_0=ceil(r_4_0/k)*k;
for i=1:n_1
   lambda_1(i)=1/(1+rand);
   r_1(i)=max(k,exprnd(lambda_1(i)));
   r_1(i)=ceil(r_1(i)/k)*k;
end
for i=1:n_2
   lambda_2(i)=1;
   r_2(i)=max(k,exprnd(lambda_2(i)));
   r_2(i)=ceil(r_2(i)/k)*k;
end
for i=1:n_3
   lambda_3(i)=1/(5+rand);
   r_3(i)=max(k,exprnd(lambda_3(i)));
   r_3(i)=ceil(r_3(i)/k)*k;
end
for i=1:n_4
   lambda_4(i)=1;
   r_4(i)=max(k,exprnd(lambda_4(i)));
   r_4(i)=ceil(r_4(i)/k)*k;
end
sum_1=0;
sum_2=0;
sum_3=0;
sum_4=0;
a_1=zeros(n_1,1);
a_2=zeros(n_2,1);
a_3=zeros(n_3,1);
a_4=zeros(n_4,1);
b_1=zeros(n_1,1);
b_2=zeros(n_2,1);
b_3=zeros(n_3,1);
b_4=zeros(n_4,1);
density_1=zeros(n_1,1);
density_2=zeros(n_2,1);
density_3=zeros(n_3,1);
density_4=zeros(n_4,1);
% % % % % % % % % % 
for t=0:k:timesteps     
   w_1=z_1;
   w_2=z_2;
   if(z_1==1)
     if(t==r_1_0 && t==r_2_0 && a_1(1)==0 && a_2(1)==0)
         f=randi([1 2]);
           if(f==1)
               b_1(1)=1;
               z_1=z_1-1;
               r_1(1)=max(t+k,t+exprnd(lambda_1(1)));
             r_1(1)=ceil(r_1(1)/k)*k;
           elseif(f==2)
               b_2(1)=1;
               z_1=z_1-1;
                r_2(1)=max(t+k,t+exprnd(lambda_2(1)));
             r_2(1)=ceil(r_2(1)/k)*k;
           end
     elseif(t==r_1_0 && (a_2(1)==1 || t~=r_2_0)  && a_1(1)==0)
         b_1(1)=1;
               z_1=z_1-1;
               r_1(1)=max(t+k,t+exprnd(lambda_1(1)));
             r_1(1)=ceil(r_1(1)/k)*k;
     elseif((a_1(1)==1 || t~=r_1_0) && t==r_2_0 && a_2(1)==0) 
          b_2(1)=1;
           z_1=z_1-1;
           r_2(1)=max(t+k,t+exprnd(lambda_2(1)));
           r_2(1)=ceil(r_2(1)/k)*k;
     end
end
% % % % % % % % % % % % % % % 
if(z_2==1)
     if(t==r_3_0 && t==r_4_0 && a_3(1)==0 && a_4(1)==0)
         f=randi([1 2]);
           if(f==1)
               b_3(1)=1;
               z_2=z_2-1;
               r_3(1)=max(t+k,t+exprnd(lambda_3(1)));
             r_3(1)=ceil(r_3(1)/k)*k;
           elseif(f==2)
               b_4(1)=1;
               z_2=z_2-1;
                r_4(1)=max(t+k,t+exprnd(lambda_4(1)));
             r_4(1)=ceil(r_4(1)/k)*k;
           end
     elseif(t==r_3_0 && (a_4(1)==1 || t~=r_4_0)  && a_3(1)==0)
         b_3(1)=1;
               z_2=z_2-1;
               r_3(1)=max(t+k,t+exprnd(lambda_3(1)));
             r_3(1)=ceil(r_3(1)/k)*k;
     elseif((a_3(1)==1 || t~=r_3_0) && t==r_4_0 && a_4(1)==0) 
          b_4(1)=1;
           z_2=z_2-1;
           r_4(1)=max(t+k,t+exprnd(lambda_4(1)));
           r_4(1)=ceil(r_4(1)/k)*k;
     end
end
% % % % % % % % % % % % % % 
if(z_1>1)
        if(t==r_1_0 && a_1(1)==0)
          b_1(1)=1;
               z_1=z_1-1;
               r_1(1)=max(t+k,t+exprnd(lambda_1(1)));
             r_1(1)=ceil(r_1(1)/k)*k;
         end
       if(t==r_2_0 && a_2(1)==0)
           b_2(1)=1;
               z_1=z_1-1;
                r_2(1)=max(t+k,t+exprnd(lambda_2(1)));
             r_2(1)=ceil(r_2(1)/k)*k;
       end
end
if(z_2>1)
        if(t==r_3_0 && a_3(1)==0)
          b_3(1)=1;
               z_2=z_2-1;
               r_3(1)=max(t+k,t+exprnd(lambda_3(1)));
             r_3(1)=ceil(r_3(1)/k)*k;
         end
       if(t==r_4_0 && a_4(1)==0)
           b_4(1)=1;
               z_2=z_2-1;
                r_4(1)=max(t+k,t+exprnd(lambda_4(1)));
             r_4(1)=ceil(r_4(1)/k)*k;
       end
     end
% % % % % % % % % % % % %        
   if( t==r_1(n_1) )
          if(a_1(n_1)==1)
              b_1(n_1)=0;
              z_2=z_2+1;
          end
   end     
   if( t==r_2(n_2))
     if(a_2(n_2)==1)
              b_2(n_2)=0;
              z_2=z_2+1;
          
     end
   end
 if( t==r_3(n_3) )
          if(a_3(n_3)==1)
              b_3(n_3)=0;
              z_1=z_1+1;
          end
   end     
   if( t==r_4(n_4))
     if(a_4(n_4)==1)
              b_4(n_4)=0;
              z_1=z_1+1;
          
     end
   end
% % % % % % % % % % 
   if(w_1~=z_1 || t==r_1_0 )
       r_1_0=max(t+k,t+exprnd(lambda_0_1*(1/z_1)));
        r_1_0=ceil(r_1_0/k)*k;
   end
   if(w_1~=z_1 || t==r_2_0 )
     r_2_0=max(t+k,t+exprnd(lambda_0_2*(1/z_1)));
        r_2_0=ceil(r_2_0/k)*k;
   end
if(w_2~=z_2 || t==r_3_0 )
     r_3_0=max(t+k,t+exprnd(lambda_0_3*(1/z_2)));
        r_3_0=ceil(r_3_0/k)*k;
end
if(w_2~=z_2 || t==r_4_0 )
     r_4_0=max(t+k,t+exprnd(lambda_0_4*(1/z_2)));
        r_4_0=ceil(r_4_0/k)*k;
   end

       if(z_1<=0)
           r_2_0=0;
           r_1_0=0;
       end
       if(z_2<=0)
           r_3_0=0;
           r_4_0=0;
       end
  %%%%%%%%%%%%%%%%%%%%%%%%%
    for m=n_1-1:-1:1
        if(t==r_1(m))
            if(a_1(m)==1 && a_1(m+1)==0)
                b_1(m+1)=1;
                b_1(m)=0;
                r_1(m+1)=max(t+k,t+exprnd(lambda_1(m+1)));
                r_1(m+1)=ceil(r_1(m+1)/k)*k;
            else
                r_1(m)=max(t+k,t+exprnd(lambda_1(m)));
                r_1(m)=ceil(r_1(m)/k)*k;
            end
        end
    end
     for m=n_2-1:-1:1
        if(t==r_2(m))
            if(a_2(m)==1 && a_2(m+1)==0)
                b_2(m+1)=1;
                b_2(m)=0;
               r_2(m+1)=max(t+k,t+exprnd(lambda_2(m+1)));
                r_2(m+1)=ceil(r_2(m+1)/k)*k;
            else
                r_2(m)=max(t+k,t+exprnd(lambda_2(m)));
                r_2(m)=ceil(r_2(m)/k)*k;
            end
        end
     end
for m=n_3-1:-1:1
        if(t==r_3(m))
            if(a_3(m)==1 && a_3(m+1)==0)
                b_3(m+1)=1;
                b_3(m)=0;
                r_3(m+1)=max(t+k,t+exprnd(lambda_3(m+1)));
                r_3(m+1)=ceil(r_3(m+1)/k)*k;
            else
                r_3(m)=max(t+k,t+exprnd(lambda_3(m)));
                r_3(m)=ceil(r_3(m)/k)*k;
            end
        end
    end
     for m=n_4-1:-1:1
        if(t==r_4(m))
            if(a_4(m)==1 && a_4(m+1)==0)
                b_4(m+1)=1;
                b_4(m)=0;
               r_4(m+1)=max(t+k,t+exprnd(lambda_4(m+1)));
                r_4(m+1)=ceil(r_4(m+1)/k)*k;
            else
                r_4(m)=max(t+k,t+exprnd(lambda_4(m)));
                r_4(m)=ceil(r_4(m)/k)*k;
            end
        end
     end
% % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % 
   a_1=b_1; 
   a_2=b_2;
   a_3=b_3;
   a_4=b_4;
   
   if(t>=7*(10^3))
       sum_1=sum_1+z_1;
       count=count+1;
       for p=1:n_1
          if(a_1(p)==1)
          density_1(p)=density_1(p)+1;
          end
       end
       for p=1:n_2
          if(a_2(p)==1)
          density_2(p)=density_2(p)+1;
          end
       end
       for p=1:n_3
          if(a_3(p)==1)
          density_3(p)=density_3(p)+1;
          end
       end
       for p=1:n_4
          if(a_4(p)==1)
          density_4(p)=density_4(p)+1;
          end
       end
   end
end
%%%%%Averaging
w_1=sum_1/(count);
for p=1:n_1
 density_1(p)=density_1(p)/count;
end
 for p=1:n_2
 density_2(p)=density_2(p)/count;
 end
  for p=1:n_3
 density_3(p)=density_3(p)/count;
  end
   for p=1:n_4
 density_4(p)=density_4(p)/count;
   end

   %%%%Comparing with simulation result of RFMs.
s=zeros(n_1+n_2+n_3+n_4+2,1);
s(n_1+n_2+n_3+n_4+2)=5;
[tsol,xsol]=ode23s(@(t,x)rfmnp_pool_2_gen(t,x,lambda_1,lambda_3),[0 100000],s);
   k=length(tsol);
% % % % % 
   plot(1:n_1,xsol(k,1:n_1));
   hold on;
    plot(1:n_2,xsol(k,n_1+1:n_1+n_2),'m');
   plot(1:n_1,density_1,'*');
   plot(1:n_2,density_2,'o');
    axis([1 n_1 0 1]);
   figure;
   plot(1:n_3,xsol(k,n_1+n_2+1:n_1+n_2+n_3));
   hold on;
    plot(1:n_4,xsol(k,n_1+n_2+n_3+1:n_1+n_2+n_3+n_4),'m');
   plot(1:n_3,density_3,'*');
   plot(1:n_4,density_4,'o');
    axis([1 n_4 0 1]);
  
toc
