clc;
clear all;
%%%%%%%note: Corresponding to the examples, input the variables directly to
%%%%%%%the function file or supply them through parameters. 
% m_1=1;
% m_2=1;
% for i=1:m_1
%     n(i)=2;
% end
% for i=m_1+1:m_1+m_2
%     n(i)=1;
%  end
% % n(m_1+m_2+1)=0;
% b=0;
% for i=1:m_1
%           b=b+n(i);
% end
%       p=b;
% b=0;
% for i=1:m_1+m_2
%           b=b+n(i);
% end
%       f=b;
%       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%stability
% %        lamb(1:m_1,1:n(1))=0.1+2*rand(m_1,n(1));
% %        lamb(m_1+1:m_1+m_2,1:n(1))=1+10*rand(m_2,n(1));
% %  lamb=ones(m_1+m_2,42);
%   s_1=zeros(f+2,1);
% s_2=zeros(f+2,1);
% s_3=zeros(f+2,1);
% s_4=zeros(f+2,1);
% s_1(1)=0.5;
%   s_1(f+2)=0.5;
% s_2(f+1)=5;
% s_2(f+2)=6;
% s_3(f+1)=4;
% s_3(f+2)=6;
% s_3(4)=1;
% s_4(1:10)=1;
% s_4(f+1)=1;
% s_5=zeros(p+1,1);
% s_5(p+1)=8;
% % a=0.5+5*rand(m,n(1)-2);
% % b=0.5+5*rand(m,n(1)-2);
%  [t,x]=ode23s(@(t,x)rfmnp_pool_2_1(t,x),[0 30000],s_1);
% v_1=round(x(length(t),:),5);
% % % 
% % [t_1,x_1]=ode23s(@(t,x)rfmnp_pool_2_gen(t,x,lamb),[0 30000],s_2);
% % v_2=round(x_1(length(t_1),:),4);
% % 
% % [t_2,x_2]=ode23s(@(t,x)rfmnp_pool_2_gen(t,x,lamb),[0 30000],s_3);
% % v_3=round(x_2(length(t_2),:),4);
% % 
% % [t_3,x_3]=ode23s(@(t,x)rfmnp_pool_2_gen(t,x,lamb),[0 30000],s_4);
% % v_4=round(x_3(length(t_3),:),4);
% % 
% % f_1=v_1==v_2;
% % f_2=v_2==v_3;
% % f_3=v_3==v_4;
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Global
% % s=zeros(4,2);
% % s(1:4,1)=0.1;
% % s(1,2)=0.4;
% % 
% % for i=1:2
% %  [t,x]=ode23s(@(t,x)rfmnp_pool_2_global(t,x),[0 30000],s(:,i));
% figure;
% plot(t,x(:,1));
% hold on;
% plot(t,x(:,2));
% plot(t,x(:,3));
% plot(t,x(:,4));
% plot(t,x(:,5));
% plot(t,x(:,6));
% % end

% 

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Entrainment
% % s_1=zeros(6,1);
% % s_1(5)=1;
% % s_1(6)=1;
% %    [t,x]=ode23s(@(t,x)rfmnp_pool_2_gen(t,x),[0 30],s_1);
% %    plot(t,x(:,1));
% %    hold on;
% %     plot(t,x(:,2));
% %  plot(t,x(:,3));
% %   plot(t,x(:,4));
% %    plot(t,x(:,5));
% %     plot(t,x(:,6));
% % %      plot(t,x(:,7));



