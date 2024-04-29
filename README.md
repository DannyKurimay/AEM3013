  # Paper Airplane Numerical Study
  Final Project: AEM 3103 Spring 2024

  - By: Daniel Kurimay

  ## Summary of Findings
  <Show the variations studied in a table>

  Summarized what was accomplished in this study.  Describe 2-4 observations from simulating the flight path.
  Reference the figures below as needed.

  *If the analysis falls short of the goal, this is your chance to explain what was done or what were the barriers.*
 
  # Code Listing
  A list of each function/script and a single-line description of what it does.  The name of the function/script should link to the file in the repository on GitHub.

  # Figures

  ## Fig. 1: Single Parameter Variation
  2D trajectory simulated by varying single parameter at at time
  ![](https://github.com/DannyKurimay/AEM3013/blob/master/docs/controlledvariation.png)
  
  Top subplot shows 2D trajectory of paper airplane at Initial velocity = 3.55 m/s, Initial flight path angle = [0.22,-0.68,-0.18], where -0.18 is nominal
   Bottom subplot shows 2D trajectory of paper airplane at Initial flight path angle = -0.18, Initial velocity = [11.05,1.55,3.55], where 3.55 is nominal

  ## Fig. 2: Monte Carlo Simulation
  2D trajectories simulated using random sampling of parameters, overlayed polynomial fit onto plot.
  ![](https://github.com/DannyKurimay/AEM3013/blob/master/docs/randomvariation.png)

  100 2D trajectory simulations at random velocity from 1.55 m/s (black) to 11.05 (red), and random flight path angle from -0.68 rad (black) to 0.22 (green)

 ## Fig. 3: Time Derivatives
 Time-derivative of height and range for the fitted trajectory
   
![](https://github.com/DannyKurimay/AEM3013/blob/master/docs/xyvelocity.png)


  Time derivative of x and y position (x and y velocity)
