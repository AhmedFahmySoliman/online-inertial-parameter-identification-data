<!DOCTYPE html>
<html lang="en">

<h2>Code and Data: Online Inertial Parameter Identification Experiments</h2>

<h3>
Ahmed Fahmy Soliman, Patrick M. Wensing, and Barkan Ugurlu
</h3>

<p>
This repository contains the code and data associated with the paper:
</p>

<p>
<b>"An Online Inertial Parameter Identification Framework with Complete Physical Consistency: Lower-Body Exoskeleton Use Case"</b><br>
Accepted for publication in <i>IEEE Transactions on Automation Science and Engineering (T-ASE)</i>.
</p>

<hr>

<h3>General Information</h3>

<p>
This repository provides the code and experimental data used to reproduce the results and figures reported in the paper. The study evaluates an online inertial parameter identification framework using both simulation and hardware experiments with a lower-body exoskeleton. For detailed descriptions of the identification framework, algorithms, and experimental methodology, readers are referred to the corresponding paper.
</p>

<h3>Simulation Experiments</h3>

<p>
The identification algorithms are evaluated using an assistive bipedal lower-body exoskeleton with an integrated human model, as shown in Figure 1. Each leg of the exoskeleton has four degrees of freedom (DoF):
</p>

<ul>
<li>2 DoF at the hip joint (abduction/adduction and flexion/extension),</li>
<li>1 DoF at the knee joint (flexion/extension), and</li>
<li>1 DoF at the ankle joint (dorsiflexion/plantarflexion).</li>
</ul>

<p>
A human model with 26 passive DoFs is coupled to the exoskeleton through cuffs. The combined human-exoskeleton system is simulated using the RaiSim simulator. The simulation software is implemented in C/C++ with the GNU Scientific Library and evaluated using human models with different anthropometric and inertial parameters.
</p>

<style type="text/css">
div.box {
    text-align: center;
}
</style>

<div class="box">
<img src="Fig1.png" width="40%" height="56%"/>
<p>
Figure 1: Left: Joint configuration of the bipedal exoskeleton and keyframe definition. Right: Simulation model in RaiSim.
</p>
</div>

<p>
The simulation was performed 72 times using 12 different anthropomorphic subjects, each performing forward walking at six different velocities (80, 90, 100, 110, 120, and 130 mm/s). The anthropometric data for the simulated subjects are provided in Table 1. The exoskeleton mass is approximately 40 kg.
</p>

<table border="1" cellpadding="10" cellspacing="0">
<thead>
<tr>
<th>Subject</th>
<th>Height (cm)</th>
<th>Breadth (cm)</th>
<th>Mass (kg)</th>
</tr>
</thead>

<tbody>
<tr><td>S1</td><td>181</td><td>46</td><td>66</td></tr>
<tr><td>S2</td><td>175</td><td>47</td><td>75</td></tr>
<tr><td>S3</td><td>170</td><td>49</td><td>80</td></tr>
<tr><td>S4</td><td>172</td><td>49</td><td>80</td></tr>
<tr><td>S5</td><td>183</td><td>49</td><td>81</td></tr>
<tr><td>S6</td><td>177</td><td>50</td><td>87</td></tr>
<tr><td>S7</td><td>187</td><td>50</td><td>89</td></tr>
<tr><td>S8</td><td>190</td><td>51</td><td>91</td></tr>
<tr><td>S9</td><td>183</td><td>51</td><td>95</td></tr>
<tr><td>S10</td><td>185</td><td>53</td><td>102</td></tr>
<tr><td>S11</td><td>190</td><td>52</td><td>102</td></tr>
<tr><td>S12</td><td>170</td><td>47</td><td>70</td></tr>
</tbody>
</table>

<p>Table 1: Anthropometric data of the simulated subjects.</p>

<hr>

<h3>Hardware Experiments</h3>

<p>
The proposed identification algorithm is experimentally evaluated using the in-house-developed bipedal exoskeleton with an integrated passive dummy manikin (Figure 2). The exoskeleton is equipped with eight series elastic actuators at the active joints, each with two encoders for measuring angular displacement and spring deflection. Force-sensitive resistors (FSRs) are installed on each foot sole to measure ground reaction forces, while an inertial measurement unit (IMU) located at the pelvis measures angular velocity and linear acceleration.
</p>

<div style="text-align: center;">
<img src="Fig2.png" width="36%" height="60%"
alt="Figure 2: The bipedal exoskeleton supporting a passive dummy manikin."/>
<p>
Figure 2: The bipedal exoskeleton prototype supporting a passive dummy manikin.
</p>
</div>

<hr>

<h3>Figure Descriptions and Regeneration Instructions</h3>

<p>
All figures were generated using MATLAB R2024b. The MATLAB code was developed and tested on Ubuntu Linux. File paths in the provided MATLAB code are constructed using <code>fullfile()</code> where applicable to improve compatibility across operating systems.
</p>

<p>
The figures reproduced by this repository and their corresponding figure numbers in the manuscript or supplementary material are listed in Table 2.
</p>

<p>
To regenerate a figure:
</p>

<ol>
<li>Open MATLAB.</li>
<li>Navigate to the <code>code</code> folder.</li>
<li>Run the <code>main()</code> function from the MATLAB command window using the input arguments specified in Table 2.</li>
</ol>

<p>
The <code>main()</code> function accepts up to three input arguments
(<code>i1</code>, <code>i2</code>, and <code>i3</code>), depending on the figure being reproduced. Figures labeled 1S–6S correspond to figures in the supplementary material.
</p>

<p>
For convenience, a short guidance video
(<code>Repository_Guide.mp4</code>) is included to demonstrate the figure regeneration process.
</p>

<table border="1" cellpadding="10" cellspacing="0">
<thead>
<tr>
<th>Figure</th>
<th>Description</th>
<th>Figure Index in the Manuscript or Supplementary Material</th>
<th>Regeneration Code</th>
</tr>
</thead>

<tbody>

<tr>
<td>1</td>
<td>Left: Relative error $e_{rel}$ for simulation runs with and without a filtered regressor. Right: Relative error $e_{rel}$ for different filter cutoff frequencies $\gamma$.</td>
<td>3</td>
<td>$main(i_1)$ <br> $i_1 = 3$</td>
</tr>

<tr>
<td>2</td>
<td>Computation time $t_c$ and relative error $e_{rel}$ across the three identification methods.</td>
<td>4</td>
<td>$main(i_1)$ <br> $i_1 = 4$</td>
</tr>

<tr>
<td>3</td>
<td>Estimated right-leg joint torques $\hat{\mathbf{\tau}}$ versus actual torques $\mathbf{\tau}_{act}$ and initial-guess torques $\check{\mathbf{\tau}}$.</td>
<td>5</td>
<td>
$main(i_1,i_2,i_3)$ <br>
$i_1 = 5$ <br>
$i_2 \in \{1,2,\dots,12\} \subset \mathbb{Z}$ <br>
$i_3 = [i_{3,1}, i_{3,2}] \in \{80,90,100,110,120,130\}^2 \subset \mathbb{Z}^2$
</td>
</tr>

<tr>
<td>4</td>
<td>Estimated right-leg null-space-projected joint torques $\tilde{\tau}^{est}$ versus measured null-space-projected joint torques $\tilde{\tau}^{act}$.</td>
<td>7</td>
<td>
$main(i_1,i_2)$ <br>
$i_1 = 7$ <br>
$i_2 \in \{1,2,3,4\}$
</td>
</tr>

<tr>
<td>5</td>
<td>(a) Experimental robot-joint absolute torque errors. (b) Experimental computation time $t_c$.</td>
<td>8</td>
<td>$main(i_1)$ <br> $i_1 = 8$</td>
</tr>

<tr>
<td>6</td>
<td>Representative simulation and hardware experiments. (a,c) Parameter convergence metric $d_\pi(t)$, where the dashed lines indicate settling times within the $\epsilon_\pi=0.05$ band. (b,d) Temporal evolution of the floating-base, hip, thigh, shank, and foot masses identified by the proposed method.</td>
<td>9</td>
<td>
$main(i_1,i_2,i_3)$ <br>
$i_1 = 9$ <br>
$i_2 \in \{1,2,3,4\}$ <br>
$i_3 \in \{1,2,\dots,12\}$
</td>
</tr>

<tr>
<td>7</td>
<td>Mean $\pm$ SD performance of the identification methods: (a) torque RMSE and (b) computation time.</td>
<td>10</td>
<td>$main(i_1)$ <br> $i_1 = 10$</td>
</tr>

<tr>
<td>8</td>
<td>Computation time $t_c$ for two models walking at different velocities over different simulation runs.</td>
<td>1S</td>
<td>
$main(i_1,i_2)$ <br>
$i_1 = '1S'$ <br>
$i_2 = [i_{2,1}, i_{2,2}] \in \{1,2,\dots,12\}^2 \subset \mathbb{Z}^2$
</td>
</tr>

<tr>
<td>9</td>
<td>Relative error $e_{rel}$ for four models walking at different velocities over different simulation runs.</td>
<td>2S</td>
<td>
$main(i_1,i_2)$ <br>
$i_1 = '2S'$ <br>
$i_2 = [i_{2,1}, i_{2,2}, i_{2,3}, i_{2,4}] \in \{1,2,\dots,12\}^4 \subset \mathbb{Z}^4$
</td>
</tr>

<tr>
<td>10</td>
<td>Variation of the estimated inertia-tensor eigenvalues and corresponding triangle-inequality conditions during a representative simulation run.</td>
<td>3S</td>
<td>
$main(i_1,i_2,i_3)$ <br>
$i_1 = '3S'$ <br>
$i_2 \in \{1,2,\dots,12\} \subset \mathbb{Z}$ <br>
$i_3 \in \{80,90,100,110,120,130\} \subset \mathbb{Z}$
</td>
</tr>

<tr>
<td>11</td>
<td>Estimated masses of the floating base, hip, thigh, shank, and foot ($m_{fb}$, $m_h$, $m_{th}$, $m_{sh}$, and $m_f$). Mean $\pm$ SD is shown using shaded regions, with mean values represented by solid lines.</td>
<td>4S</td>
<td>
$main(i_1,i_2)$ <br>
$i_1 = '4S'$ <br>
$i_2 \in \{1,2,\dots,12\} \subset \mathbb{Z}$
</td>
</tr>

<tr>
<td>12</td>
<td>Experimental variation in the estimated link inertia-tensor eigenvalues and corresponding triangle-inequality conditions.</td>
<td>5S</td>
<td>
$main(i_1,i_2)$ <br>
$i_1 = '5S'$ <br>
$i_2 \in \{1,2,3,4\} \subset \mathbb{Z}$
</td>
</tr>

<tr>
<td>13</td>
<td>Experimental variation in the estimated link masses.</td>
<td>6S</td>
<td>
$main(i_1,i_2)$ <br>
$i_1 = '6S'$ <br>
$i_2 \in \{1,2,3,4\} \subset \mathbb{Z}$
</td>
</tr>

</tbody>
</table>

<p>
<b>Table 2.</b> Description of the figures included in the repository.
<b>Column 1:</b> Figure index in the repository.
<b>Column 2:</b> Description of the figure content.
<b>Column 3:</b> Corresponding figure number in the manuscript or supplementary material.
<b>Column 4:</b> Instructions for reproducing the figure using the <code>main()</code> function, including the required input arguments and their constraints.
The set <code>{1,2,...,12}</code> denotes the simulated subject index,
<code>{80,90,100,110,120,130}</code> denotes the walking velocity in mm/s,
and <code>{1,2,3,4}</code> denotes the representative hardware experiment index.
</p>

<hr>

<h3>Authors</h3>

<p>
<b>Ahmed Fahmy Soliman</b><br>
Robotics and Artificial Intelligence Collaboration (RAICo), The University of Manchester, United Kingdom<br>
Email: ahmed.soliman@manchester.ac.uk
</p>

<p>
<b>Patrick M. Wensing</b><br>
Department of Aerospace and Mechanical Engineering, University of Notre Dame, USA<br>
Email: pwensing@nd.edu
</p>

<p>
<b>Barkan Ugurlu</b><br>
Department of Mechanical Engineering, Özyeğin University, Türkiye<br>
Email: barkan.ugurlu@ozyegin.edu.tr
</p>
