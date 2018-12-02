x = [0 0 15 10]; %x positions of comp
y = [0 25 25 15]; %y positions of comp

Sx = 10; %known location of source.. wont know this for project
Sy = 15;

%distance calculations from mic to source
D1 = sqrt(((x(1)-Sx)^2)+((y(1)-Sy)^2));
D2 = sqrt(((x(2)-Sx)^2)+((y(2)-Sy)^2));
D3 = sqrt(((x(3)-Sx)^2)+((y(3)-Sy)^2));


th = 0:pi/100:2*pi; %the step size determines how close the circles are to the radi

xunit1 = D1 * cos(th) + x(1); %graphs circle around mic 1
yunit1 = D1 * sin(th) + y(1);

xunit2 = D2 * cos(th) + x(2); %graphs circle around mic 2
yunit2 = D2 * sin(th) + y(2);

xunit3 = D3 * cos(th) + x(3); %graphs circle around mic 3
yunit3 = D3 * sin(th) + y(3);

figure
%positions of mics
scatter(x,y)
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
plot([x(1),xunit1(1)],[y(1),yunit1(1)]);
hold on
plot([x(2),xunit2(1)],[y(2),yunit2(1)]);
hold on
plot([x(3),xunit3(101)],[y(3),yunit3(101)]);  

grid on
xlim([-1 16])
ylim([-1 26])


%%determining location of source
%the idea here is to find the points on the radi that are closest to each
%other, then determines something close to sound source
DTM1 = zeros(length(xunit1)+2,length(xunit1));
DTM2 = zeros;
for i = 1:1:length(xunit1)
    for j = 1:1:length(xunit1)
        DTM1(i,j) = sqrt(((xunit1(i)-xunit2(j))^2)+((xunit1(i)-yunit2(j))^2));
        DTM2(i,j) = sqrt(((xunit1(i)-xunit3(j))^2)+((xunit1(i)-yunit3(j))^2));
    end
end  

% for i = 1:1:length(xunit1)
%    for j = 1:1:length(xunit1)
%       if DTM1(i,j+1)
%    end
% end


