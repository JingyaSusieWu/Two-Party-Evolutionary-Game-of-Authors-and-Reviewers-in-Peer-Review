% Purpose:
%   Main script for simulating and plotting the initial evolutionary paths
%   of the two-party evolutionary game between authors and reviewers.
%
% Description:
%   This script repeatedly solves the replicator dynamic system defined in
%   AR_IEP.m from different initial conditions. The initial values of m and n
%   are both varied from 0 to 1 with a step size of 0.1. The resulting
%   evolutionary trajectories are plotted in the m-n phase plane.
%
% Required file:
%   AR_IEP.m
%
% Output:
%   A phase-plane plot showing the initial evolutionary paths under the
%   specified parameter setting.
%
% MATLAB version:
%   MATLAB R2021b


% Main Program

clear;clc % Clear the workspace and command window.

for i=0:0.1:1 % Initial value of m: 0 is the lower bound, 1 is the upper bound, and 0.1 is the step size.

    for j=0:0.1:1 % Initial value of n.

        [t,y]=ode45('AR_IEP',[0 10],[i j]); % Solve the ordinary differential equations using ode45. The interval [0 10] denotes the evolutionary time span.
   
        grid on % Display grid lines.
        plot(y(:,1),y(:,2)); % Plot the trajectory in the m-n phase plane; y(:,1) denotes m, and y(:,2) denotes n.
        % plot(t,y(:,2)); % Alternative plot: evolution of n over time.

        hold on % Retain the previous trajectories so that all paths are shown in the same figure.
        axis([0 1 0 1]) % Set the range of the horizontal and vertical axes to [0,1].
        xlabel('m'); % Label of the horizontal axis.
        ylabel('n'); % Label of the vertical axis.
  
    end

end