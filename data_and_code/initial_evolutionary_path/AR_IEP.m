% Purpose:
%   Defines the two-dimensional replicator dynamic system used to analyze
%   the initial evolutionary path of the author-reviewer evolutionary game.
%
% Description:
%   This function is called by the main script InitialEvolutionaryPath.m.
%   The state variables are:
%       y(1): m, the probability or proportion of authors adopting the
%             selected strategy.
%       y(2): n, the probability or proportion of reviewers adopting the
%             selected strategy.
%
%   The function returns the time derivatives of m and n according to the
%   replicator dynamic equations specified in the manuscript.
%
% MATLAB version:
%   MATLAB R2021b

% Main Fuction
function dydt=AR_IEP(t,y) % t denotes evolutionary time; y contains the two state variables y(1) and y(2).

B=2; F=2; W1=4; W2=2; c1=5; c2=2; e1=4; e2=1; % Parameter assignment.

dydt=zeros(2,1); % Initialize a two-dimensional system of ordinary differential equations.

dydt(1)=-y(1)*(y(1) - 1)*(c2 - c1 + B*y(2) + F*y(2)); % Replicator dynamic equation for authors.
dydt(2)=-y(2)*(y(2) - 1)*(W2 - e1 + e2 + W1*y(1) - W2*y(1)); % Replicator dynamic equation for reviewers.

end
