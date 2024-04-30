  # Paper Airplane Numerical Study
  Final Project: AEM 3103 Spring 2024

  - By: Daniel Kurimay

  ## Summary of Findings

 Velocity has a bigger affect on range and height than flight path angle, this can clearly be seen in figure 1. The flight path angle variations dont change the outcome by much compared to the velocity variations seen in the lower subplot.
 This is supported in figure 2, where we can see that the majority paths with higher range had a high initial velocity.  
 Another observations we can make is that planes with extreme initial conditions eventually normalize. This can again be seen in figure 2, where planes with a high initial velocity and those with a high initial flight path angle go very high or very low at first, but then straighten out to an almost linear path.
 This is suppored further by figure 3, were we can see that the average x and y velocity is more extreme at the beginnging, and slowly flattens out over time 

### Table of tested conditions (independently)
|         | Velocity   | Gamma       |   |   |
|---------|------------|-------------|---|---|
| High    | 7.5 (m/s)  | 0.4 (rad)   |   |   |
| Nominal | 3.55 (m/s) | -0.18 (rad) |   |   |
| Low     | 2 (m/s)    | -0.5 (rad)  |   |   |

 
  # Code Listing
  [Single parameter variation](https://github.com/DannyKurimay/AEM3013/blob/master/SingleParameterVariation.m#L26-L73) Makes plot of paper airplane trajectory, indivually varying velocity and flight path angle.  
  [Monte carlo simulation](https://github.com/DannyKurimay/AEM3013/blob/master/MonteCarlo.m#L3-L29) simulates and graphs 100 random paper airplane flights.  
  [Monte carlo curve fit](https://github.com/DannyKurimay/AEM3013/blob/master/MonteCarlo.m#L31-L40) uses polynomial fitting to graph an average flight path across 100 fights.  
  [Time derivatives for monte carlo curve fit](https://github.com/DannyKurimay/AEM3013/blob/master/MonteCarlo.m#L42-L55) takes time derivatives of range and height of the polynomial to get average x and y velocity.  

  # Figures
  ## Fig. 1: Single Parameter Variation
  2D trajectory simulated by varying single parameter at at time
  ![](https://github.com/DannyKurimay/AEM3013/blob/master/docs/controlledvariation.png)
  
  Top subplot shows 2D trajectory of paper airplane at Initial velocity = 3.55 m/s, Initial flight path angle = [0.4,-.18,-0.5], where -0.18 is nominal
  Bottom subplot shows 2D trajectory of paper airplane at Initial flight path angle = -0.18 rad, Initial velocity = [2,3.55,7.5], where 3.55 is nominal

  ## Fig. 2: Monte Carlo Simulation
  ![](https://github.com/DannyKurimay/AEM3013/blob/master/docs/randomvariation.png)

  100 2D trajectory simulations at random velocity from 2 m/s (black) to 7.5 (red), and random flight path angle from -0.5 rad (black) to 0.4 (green)
  9th order polynomial fit

 ## Fig. 3: Time Derivatives
 Time-derivative of height and range for the fitted trajectory
![](https://github.com/DannyKurimay/AEM3013/blob/master/docs/xyvelocity.png)

  Time derivative of x and y position is x and y velocity.  
  The graph makes sense because the y velocity is generally negative, meaning the airplane is slowly falling,
  and the x velocity is generally postive because the airplane tends to move forward.