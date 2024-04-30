%	Example 1.3-1 Paper Airplane Flight Path
%	Copyright 2005 by Robert Stengel
%	August 23, 2005

	global CL CD S m g rho	
	S		=	0.017;			% Reference Area, m^2
	AR		=	0.86;			% Wing Aspect Ratio
	e		=	0.9;			% Oswald Efficiency Factor;
	m		=	0.003;			% Mass, kg
	g		=	9.8;			% Gravitational acceleration, m/s^2
	rho		=	1.225;			% Air density at Sea Level, kg/m^3	
	CLa		=	3.141592 * AR/(1 + sqrt(1 + (AR / 2)^2));
							% Lift-Coefficient Slope, per rad
	CDo		=	0.02;			% Zero-Lift Drag Coefficient
	epsilon	=	1 / (3.141592 * e * AR);% Induced Drag Factor	
	CL		=	sqrt(CDo / epsilon);	% CL for Maximum Lift/Drag Ratio
	CD		=	CDo + epsilon * CL^2;	% Corresponding CD
	LDmax	=	CL / CD;			% Maximum Lift/Drag Ratio
	Gam		=	-atan(1 / LDmax);	% Corresponding Flight Path Angle, rad
	V		=	sqrt(2 * m * g /(rho * S * (CL * cos(Gam) - CD * sin(Gam))));
							% Corresponding Velocity, m/s
	Alpha	=	CL / CLa;			% Corresponding Angle of Attack, rad
	
%	a) Equilibrium Glide at Maximum Lift/Drag Ratio
	H		=	2;			% Initial Height, m
	R		=	0;			% Initial Range, m
	to		=	0;			% Initial Time, sec
	tf		=	6;			% Final Time, sec
	tspan	=	[to tf];
	xo		=	[V;Gam;H;R];
	[ta,xa]	=	ode23('EqMotion',tspan,xo);

%% Part 2

    xo		=	[V;.4;H;R];
	[ta,xahighgamma]	=	ode23('EqMotion',tspan,xo);
    xo		=	[V;-.5;H;R];
	[ta,xalowgamma]	=	ode23('EqMotion',tspan,xo);

    xo		=	[7.5;Gam;H;R];
	[ta,xahighv]	=	ode23('EqMotion',tspan,xo);
    xo		=	[2;Gam;H;R];
	[ta,xalowv]	=	ode23('EqMotion',tspan,xo);
   
	plot1 = figure;
    title("test")
    subplot(2,1,1);
    title("Varied Initial Flight Path Angle")
    hold on 
    plot(xahighgamma(:,4),xahighgamma(:,3), color= [0,1,0])
    plot(xalowgamma(:,4),xalowgamma(:,3), color = [1,0,0])
    plot(xa(:,4),xa(:,3),color = [0,0,0])
    legend("High angle", "Low angle", "Nominal angle")
    xlabel("range (m)")
    ylabel("height (m)")

     subplot(2,1,2);
    title("Varied Initial Velocity")
    subtitle("t",FontSize=7)
    hold on 
    plot(xahighv(:,4),xahighv(:,3), color= [0,1,0])
    plot(xalowv(:,4),xalowv(:,3), color = [1,0,0])
    plot(xa(:,4),xa(:,3),color = [0,0,0])
    legend("High v", "Low v", "Nominal v")
    xlabel("range (m)")
    ylabel("height (m)")

    saveas(plot1, 'docs/controlledvariation.png');
    hold off



%% Part 3/4
    %pmin + (pmax-pmin)*rand(1)
    tspan = to:.1:tf;
    rangearray = [];
    heightarray = [];
    timearray = [tspan];

    plot2 = figure;
    hold on
    for i = 0:100
        randv = rand;
        randg = rand;
        xo = [2 + 7.5*randv;-0.5 + 0.4*randg;H;R];
	[ta,xr]	= ode23('EqMotion',tspan,xo);
    plot(xr(:,4),xr(:,3), color = [randv,randg,0])
    subtitle("Red = higher V, green = higher angle, black = average curve fit")
    rangearray(i+1,:) = xr(:,4);
    heightarray(i+1,:) = xr(:,3);
    end

    title("2D Trajectory of paper airplane with random initial conditions")
    xlabel("range (m)")
    ylabel("height (m)")

    

 % Part 4 
    n = 9; % degree polynomial

    p = polyfit(timearray, mean(heightarray),n);
    avgheight = polyval(p, timearray);
  
    p = polyfit(timearray, mean(rangearray),n);
    avgrange = polyval(p, timearray);
    plot(avgrange,avgheight, LineWidth=3, color= [0,0,0])
    hold off
    saveas(plot2, 'docs/randomvariation.png');

    % figure        I dont think this was needed
    % hold on
    % plot(timearray, avgheight, LineWidth=2)
    % plot(timearray, avgrange, LineWidth=2)
    % legend("Average height", "Average range")
    % xlabel("time (s)")
    % ylabel("(m)")

 %% Part 5
    
    plot3 = figure;
    subplot(2,1,1)
    plot(trimdata(timearray,60),diff(avgrange), linewidth = 1)
    title("Change in average range (x velocity)")
    xlabel("time (s)")
    ylabel("(m/s)")
    subplot(2,1,2)
    plot(trimdata(timearray,60),diff(avgheight), linewidth = 1)
    title("Change in average height (y velocity)")
    xlabel("time (s)")
    ylabel("(m/s)")
    saveas(plot3, 'docs/xyvelocity.png');



