%	Example 1.3-1 Paper Airplane Flight Path
%	Copyright 2005 by Robert Stengel
%	August 23, 2005
clc 
clear

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
	
%%	(1) Single Parameter Variation

 % Nominal
	H		=	2;			% Initial Height, m
	R		=	0;			% Initial Range, m
	to		=	0;			% Initial Time, sec
	tf		=	6;			% Final Time, sec
	tspan	=	[to tf];
	xo		=	[V;Gam;H;R];
	[ta,xa]	=	ode23('EqMotion',tspan,xo);
 
 % Angle Changes
    xo		=	[V;.4;H;R];
	[ta,xahighgamma]	=	ode23('EqMotion',tspan,xo);
    xo		=	[V;-.5;H;R];
	[ta,xalowgamma]	=	ode23('EqMotion',tspan,xo);

 % Velocity changes
    xo		=	[7.5;Gam;H;R];
	[ta,xahighv]	=	ode23('EqMotion',tspan,xo);
    xo		=	[2;Gam;H;R];
	[ta,xalowv]	=	ode23('EqMotion',tspan,xo);
   
  % Plot angle figures
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
  % Plot velocity figures
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
 % Save figures
    saveas(plot1, 'docs/controlledvariation.png');



