% Purpose:
%   Defines the two-dimensional replicator dynamic system used for parameter
%   sensitivity analysis in the author-reviewer evolutionary game.
%
% Description:
%   This function is called by ParameterSensibility_Reviewer.m and related
%   parameter sensitivity scripts. It returns the time derivatives of the two
%   state variables according to the replicator dynamic equations specified
%   in the manuscript.
%
% MATLAB version:
%   MATLAB R2021b


% Main Fuction

function dydt=AR_PS(t,y,B,c1,c2,F,e1,e2,W1,W2) % Define the replicator dynamic system.
dydt=zeros(2,1);% Initialize a two-dimensional system of ordinary differential equations.

dydt(1)=-y(1)*(y(1) - 1)*(c2 - c1 + B*y(2) + F*y(2));% Replicator dynamic equation for authors; x is represented by y(1), and y is represented by y(2).
dydt(2)=-y(2)*(y(2) - 1)*(W2 - e1 + e2 + W1*y(1) - W2*y(1));% Replicator dynamic equation for reviewers.
end