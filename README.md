  # Paper Airplane Numerical Study
  Final Project: AEM 3103 Spring 2024

  - By: Daniel Kurimay

  ## Summary of Findings
  <Show the variations studied in a table>

    | idk     | Velocity  | Gamma      |
    |---------| --------  | --------   |
    | High    | 7.5 (m/s) | 0.4 (rad)  |
    | Nominal | 3.55 (m/s)| -0.18 (rad)|
    | Low     | 2 (m/s)   | -0.5 (rad) |


  Summarized what was accomplished in this study.  Describe 2-4 observations from simulating the flight path.
  Reference the figures below as needed.

  *If the analysis falls short of the goal, this is your chance to explain what was done or what were the barriers.*
 
  # Code Listing
  A list of each function/script and a single-line description of what it does.  The name of the function/script should link to the file in the repository on GitHub.
  [Single parameter variation](https://github.com/DannyKurimay/AEM3013/blob/master/SingleParameterVariation.m#L26) Makes plot of paper airplane trajectory, indivually varying velocity and flight path angle.
  [Monte carlo simulation](https://github.com/DannyKurimay/AEM3013/blob/master/MonteCarlo.m#L3) simulates and graphs 100 random paper airplane flights. 
  [Monte carlo curve fit](https://github.com/DannyKurimay/AEM3013/blob/master/MonteCarlo.m#L31) uses polynomial fitting to graph an average flight path across 100 fights.
  [Time derivatives for monte carlo curve fit](https://github.com/DannyKurimay/AEM3013/blob/master/MonteCarlo.m#L42) takes time derivatives of range and height of the polynomial to get average x and y velocity.

  # Figures

  ## Fig. 1: Single Parameter Variation
  2D trajectory simulated by varying single parameter at at time
  ![](https://github.com/DannyKurimay/AEM3013/blob/master/docs/controlledvariation.png)
  
  Top subplot shows 2D trajectory of paper airplane at Initial velocity = 3.55 m/s, Initial flight path angle = [0.4,-.18,-0.5], where -0.18 is nominal
  Bottom subplot shows 2D trajectory of paper airplane at Initial flight path angle = -0.18 rad, Initial velocity = [2,3.55,7.5], where 3.55 is nominal

  ## Fig. 2: Monte Carlo Simulation
  2D trajectories simulated using random sampling of parameters, overlayed polynomial fit onto plot.
  ![](https://github.com/DannyKurimay/AEM3013/blob/master/docs/randomvariation.png)

  100 2D trajectory simulations at random velocity from 2 m/s (black) to 7.5 (red), and random flight path angle from -0.5 rad (black) to 0.4 (green)
  9th order polynomial fit

 ## Fig. 3: Time Derivatives
 Time-derivative of height and range for the fitted trajectory
   
![](https://github.com/DannyKurimay/AEM3013/blob/master/docs/xyvelocity.png)


  Time derivative of x and y position is x and y velocity.  
  The graph makes sense because the y velocity is generally negative, meaning the airplane is slowly falling,
  and the x velocity is generally postive because the airplane tends to move forward.