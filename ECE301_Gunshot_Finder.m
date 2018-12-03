xloc = [0 0 15 10]; %x positions of comp
yloc = [0 25 25 15]; %y positions of comp

Sx = 10; %known location of source.. wont know this for project
Sy = 15;

%distance calculations from mic to source
D1 = sqrt(((xloc(1)-Sx)^2)+((yloc(1)-Sy)^2));
D2 = sqrt(((xloc(2)-Sx)^2)+((yloc(2)-Sy)^2));
D3 = sqrt(((xloc(3)-Sx)^2)+((yloc(3)-Sy)^2));


th = 0:pi/100:2*pi; %the step size determines how close the circles are to the radi

xunit1 = D1 * cos(th) + xloc(1); %graphs circle around mic 1
yunit1 = D1 * sin(th) + yloc(1);

xunit2 = D2 * cos(th) + xloc(2); %graphs circle around mic 2
yunit2 = D2 * sin(th) + yloc(2);

xunit3 = D3 * cos(th) + xloc(3); %graphs circle around mic 3
yunit3 = D3 * sin(th) + yloc(3);


%Find the intersection of three spheres                 
%P1,P2,P3 are the centers, D1,D2,D3 are the radii       
%Implementaton based on Wikipedia Trilateration article.  
P1 = [0,0];
P2 = [0,25];
P3 = [15,25];
            
temp1 = P2-P1;
e_x = temp1/norm(temp1);
temp2 = P3-P1;
i = dot(e_x,temp2);
temp3 = temp2 - i*e_x;
e_y = temp3/norm(temp3);                                
d = norm(P2-P1);
j = dot(e_y,temp2);
x = (D1*D1 - D2*D2 + d*d) / (2*d);
y = (D1*D1 - D3*D3 -2*i*x + i*i + j*j) / (2*j);
temp4 = D1*D1 - x*x - y*y;
pa = P1 + x*e_x + y*e_y;

figure
%positions of mics
scatter(xloc,yloc)
hold on
%positions of sound source
scatter(Sx,Sy);

%circles with radi of distance from mic to source
hold on
plot(xunit1, yunit1);
hold on
plot(xunit2, yunit2);
hold on
plot(xunit3, yunit3);
hold on

%plot radi... just for visulaization
plot([xloc(1),xunit1(1)],[yloc(1),yunit1(1)]);
hold on
plot([xloc(2),xunit2(1)],[yloc(2),yunit2(1)]);
hold on
plot([xloc(3),xunit3(101)],[yloc(3),yunit3(101)]);  

%plot esmitated location
hold on
scatter(pa(1),pa(2));

grid on
xlim([-1 16])
ylim([-1 26])


%%determining location of source
%the idea here is to find the points on the radi that are closest to each
%other, then determines something close to sound source
% DTM1 = zeros(length(xunit1)+2,length(xunit1));
% DTM2 = zeros;
% for i = 1:1:length(xunit1)
%     for j = 1:1:length(xunit1)
%         DTM1(i,j) = sqrt(((xunit1(i)-xunit2(j))^2)+((xunit1(i)-yunit2(j))^2));
%         DTM2(i,j) = sqrt(((xunit1(i)-xunit3(j))^2)+((xunit1(i)-yunit3(j))^2));
%     end
% end  





