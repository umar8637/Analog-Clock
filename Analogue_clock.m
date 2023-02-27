clc
clear all
close all
x=0;  %coordinates (0,0)
y=0;
r=10;
hold on;
th=0:pi/60:2*pi;          %time period (0 to 360)                     
X_axis=r*cos(th)+x;                        %x-coordinate
Y_axis=r*sin(th)+y;                        %y-coordinate
h=plot(X_axis,Y_axis,'r','Linewidth',3);   %circle of redius 10
title('Analague clock');



r=7.5;                                  %Redius for displaying hours digits     
H_digit=1;
for th=pi/6:pi/6:2*pi;     %will run 12 time. in each iteration 30 degre.....starting from 1 which is 30 w.r.t 12 
    ytemp=r*cos(th)+y;  %coordinate
    xtemp=r*sin(th)+x;
    text(xtemp,ytemp,num2str(H_digit));
    %num2str convert number to string format to write inside plot by using text function.
    plot([xtemp/9*8 xtemp/9*7],[ytemp/9*8 ytemp/9*7],'color',[0 0 1])
    % plotting the lines for 1 to 12
    H_digit=H_digit+1;
end



%print lines in two consecutive hours
for th=0:pi/30:2*pi %will run 60 time.
    xtemp=10*sin(th);
    ytemp=10*cos(th);
    plot([xtemp/8.5*8 xtemp/8.5*7],[ytemp/9*8 ytemp/9*7],'color',[0 0 1]);
end




while(1) %non terminating condition because clock alway run.
    c=clock;     %system clock  ..... return 6 element vector
                       %  CLOCK = [year month day hour minute seconds] 
    c=c(1,4:6);  %compress date
    sec=c(1,3);  %assign second to sec veriable .....c(1,3)..seconds
    min=c(1,2);  %assign minute to min veriable......c(1,2)..minutes
    if c(1,1)>12;                             % ......c(1,1)..hours
       hr=c(1,1)-12;
    else
        hr=c(1,1);
    end 
    
    
    
    % Hour hand............
    min1=ceil(min/12);  %round off value to nearest greater value
    H_theta=(hr*pi)/6+(min1*pi)/30; %hour hand cover 0.5 degree in a minute and 30 degree in hour.
    H_ytemp=3*cos(H_theta);  %y-coordinate for hour clock
    H_xtemp=3*sin(H_theta);   %x-coordinate for hour clock
    Y1=[0 H_ytemp];          %starting point at 0.
    X1=[0 H_xtemp];
    p1=plot(X1,Y1,'b','Linewidth',3); %ploting hour hand 
    
   
    %Minute hand............
    M_theta=(min*pi)/30;    %minute hand cover 6 degree in one minute. it will change after 
    M_ytemp=5*cos(M_theta);
    M_xtemp=5*sin(M_theta);
    Y2=[0 M_ytemp];
    X2=[0 M_xtemp];
    p2=plot(X2,Y2,'g','Linewidth',3);
      
    %Second hand..........
    S_theta=(sec*pi)/30; %second hand cover 6 degree in 1 sec.
    S_ytemp=7*cos(S_theta);
    S_xtemp=7*sin(S_theta);
    Y3=[0 S_ytemp];
    X3=[0 S_xtemp];
    p3=plot(X3,Y3,'m','Linewidth',3);
    
    pause(1); %previos graph will display for 1 second then it will delete after one second and .
   
    %delete second, minute and hour hands in each iteration of while loop.      
    
    delete(p1); 
    delete(p2); 
    delete(p3); 
          
end

   
    
        