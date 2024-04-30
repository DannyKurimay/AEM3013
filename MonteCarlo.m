clear
clc
%% (2) Monte Carlo Simulation
 % Make consistant time 
    to = 0;
    tf = 6;
    H =	2;			
	R =	0;			
    tspan = to:.1:tf;
    rangearray = [];
    heightarray = [];
    timearray = [tspan];

 % Make 100 simulations with random V and gamma, plot and save to array
    plot2 = figure;
    hold on
    for i = 0:100
        randv = rand;
        randg = rand;
        xo = [2 + 7.5*randv;-0.5 + 0.4*randg;H;R];
	[ta,xr]	= ode23('EqMotion',tspan,xo);
    plot(xr(:,4),xr(:,3), color = [randv,randg,0])
    rangearray(i+1,:) = xr(:,4);
    heightarray(i+1,:) = xr(:,3);
    end
 % Label plot
    title("2D trajectories simulated using random sampling of parameters, overlayed polynomial fit onto plot.", FontSize=8)
    xlabel("range (m)")
    ylabel("height (m)")

 %% (3) Fit curve for 100 lines
    n = 9; % degree polynomial
    p = polyfit(timearray, mean(heightarray),n);
    avgheight = polyval(p, timearray);
  
    p = polyfit(timearray, mean(rangearray),n);
    avgrange = polyval(p, timearray);
    plot(avgrange,avgheight, LineWidth=3, color= [0,0,0])
    hold off
    saveas(plot2, 'docs/randomvariation.png');

 %% (4) Time derivatives
    
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
