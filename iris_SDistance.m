clc 
clear 
close all

load fisheriris 
tic;
%ijad marakez baraye 10 markaz ba faseleye lim va tedad vizhegi 2
cluster=3;
feature=4;
datanum=50;
dataall=datanum*cluster;
range=[0,10];
lim=8;
for i=1:cluster
    x=meas((i-1)*50+1:i*50,:);
    mu(i,:)=mean(x);
end

plot(meas(:,1),meas(:,2),'r*','LineWidth',1.5);
hold on;
plot(mu(:,1),mu(:,2),'y*','LineWidth',3);
hold on;
%Ijad dade haye part
numZ=20;
c=0;
while(c~=20)

    o = randi(range,1,feature);
        for k=1:cluster
            do(k) = (norm(o-mu(k,:)));
        end
           if min(do) > lim
               c=c+1;
               z(:,c)=o;  
           end        
%  do2(i)=min(sqrt((z(1,i)-mu(:,1)).^2+(z(2,i)-mu(:,2)).^2));   
end

%tariif AllData

plot(z(1,:),z(2,:),'k*','LineWidth',1.5);
x=meas;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Iteration_count=1; 
J(1)=1; 
J(2)=2; 

          
while abs(J(Iteration_count+1)-J(Iteration_count))>0.01
      j=zeros(1,cluster);  
      sums=zeros(cluster,feature);
      r=zeros(dataall,cluster);
    
      %first step
      
      for n=1:dataall
          d=zeros(1,cluster); 
          xn=diag(x(n,:));
          for k=1:cluster
              muk=diag(mu(k,:));
              d(k)=log(det((xn+muk)/2))-((log(det(xn))+log(det(muk)))/2);
          end
         
          [quantity place]=min(d);
          r(n,place)=1; 
          j(place)=d(place)^2+j(place);
          sums(place,:)=sums(place,:)+x(n,:);
          
      end
     
      %second step
      

      for k=1:cluster
      mu(k,:)=sums(k,:)/sum(r(:,k));
      end
      
      J(Iteration_count+2)=sum(j); %calculating cost function in each iteration:
    
      %plot clustering result for each iteration:

         
       Iteration_count=Iteration_count+1;  %updating number of iteration
end

[m,cluster]=find(r==1);
t=[ones(datanum,1);2*ones(datanum,1);3*ones(datanum,1)];
figure(2)   %true data
gscatter(x(:,1),x(:,2),t);
hold on;
h = gca;
hold on;
plot(mu(:,1),mu(:,2),'k*','LineWidth',3);
hold on;
lims = [h.XLim h.YLim]; % Extract the x and y axis limits
title('{\bf true data}');
xlabel('M1');
ylabel('M2');
legend('Location','Northwest');

figure(3)   %clustered data
gscatter(x(:,1),x(:,2),cluster);
hold on;
h = gca;
plot(mu(:,1),mu(:,2),'k*','LineWidth',3);
hold on;
lims = [h.XLim h.YLim]; % Extract the x and y axis limits
title('{\bf clustered data}');
xlabel('M1');
ylabel('M2');
legend('Location','Northwest');

%plot of cost function(J)
J_final=J(1,3:Iteration_count+1);
figure(4)
plot(J_final,'R*')
hold on
plot(J_final,'K')
xlabel iteration ,ylabel J

true=0;
      
for n=1:dataall
  a=t(n);
  b=r(n,:);
  [quantity place]=max(b);
  figure(5)
    if a==1
      if place==1
        true=true+1;
            stem (n,place,'r')
            hold on
      else
            stem (n,place,'b')
            hold on
      end
    end
    if a==2
      if place==2
        true=true+1;
            stem (n,place,'r')
            hold on
      else
            stem (n,place,'b')
            hold on
      end
    end          

    if a==3
      if place==3
        true=true+1;
            stem (n,place,'r')
            hold on
      else
            stem (n,place,'b')
            hold on
      end
    end         
    
                      
      end
acc=(true/dataall)*100;
disp(['classification_rate=',num2str(acc,4),'%'])
text=['classification-rate=',num2str(acc,4),'%'];
title(text);

toc