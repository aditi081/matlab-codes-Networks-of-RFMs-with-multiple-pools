function  dx = rfmnp_pool_2_gen(t ,x,p,lamb,eta)
             dx=zeros(size(x));
           lambda=zeros();
           lambda_0=zeros();
%%%%%no of lanes
           m_1=p;
           m_2=p;   
%%%dimensions of the RFMs
            for i=1:m_1
                n(i)=15;          
            end
             for i=m_1+1:m_1+m_2
                n(i)=27;
             end
           n(m_1+m_2+1)=0;  
      sum=0;
      for i=1:m_1+m_2
          sum=sum+n(i);
      end
      f=sum;
% % Rates            
            for i=1:m_1
                lambda_0(i)=lamb(1);             
                for j=1:n(i)
                    lambda(i,j)=lamb(j+1);
                end
            end
            for i=m_1+1:m_1+m_2
                lambda_0(i)=eta(1);
                for j=1:n(i)
                    lambda(i,j)=eta(j+1);
                end
            end
% pool variable            
y_1=x(f+1);
y_2=x(f+2);
% % Dynamics         
k=1;
l=n(1);
% % % % % % % % % % % 
            for i=1:m_1
% % % % % % % %                 
                dx(k)=lambda_0(i)*(1-x(k))*y_1-lambda(i,1)*x(k)*(1-x(k+1));
% % % % % % %                 
                for j=2:n(i)-1
                    dx(k-1+j)=lambda(i,j-1)*x(k-1+j-1)*(1-x(k-1+j))-lambda(i,j)*x(k-1+j)*(1-x(k-1+j+1));
                end
% % % % % % %                 
                dx(l)=lambda(i,n(i)-1)*x(l-1)*(1-x(l))-lambda(i,n(i))*x(l);
% % % % % % % % % % % % % %                   
                k=l+1;
              l=l+n(i+1);
            end
% % % % % % % % % % % % % % % %             
% % % % % % % % %    
% % % % % % % % % % % 
            for i=m_1+1:m_1+m_2
% % % % % % % %                 
                dx(k)=lambda_0(i)*(1-x(k))*y_2-lambda(i,1)*x(k)*(1-x(k+1));
% % % % % % %                 
                for j=2:n(i)-1
                    dx(k-1+j)=lambda(i,j-1)*x(k-1+j-1)*(1-x(k-1+j))-lambda(i,j)*x(k-1+j)*(1-x(k-1+j+1));
                end
% % % % % % %                 
                dx(l)=lambda(i,n(i)-1)*x(l-1)*(1-x(l))-lambda(i,n(i))*x(l);
% % % % % % % % % % % % % %                   
                k=l+1;
              l=l+n(i+1);
            end
% % % % % % % % % % % % % % % %             
             sum=0;
            l=n(1);
            for k=1:m_1
                sum=sum+lambda(k,n(k))*x(l);
                l=l+n(k+1);
            end
                v_1=sum;
             sum=0;
            for k=m_1+1:m_1+m_2
                sum=sum+lambda(k,n(k))*x(l);
                l=l+n(k+1);
            end
              v_5=sum;
% % % % % % % % % % % % % % %               
          
              sum=0;
              l=1;
            for k=1:m_1
                sum=sum+lambda_0(k)*(1-x(l))*y_1; 
                l=n(k)+l;
            end
              v_2=sum;
               sum=0;
            for k=m_1+1:m_1+m_2
                sum=sum+lambda_0(k)*(1-x(l))*y_2; 
                l=n(k)+l;
            end
              v_6=sum;
% % % % % % % % %    pool dynamics          
            dx(f+1)=v_5-v_2;
            dx(f+2)=v_1-v_6;
end   