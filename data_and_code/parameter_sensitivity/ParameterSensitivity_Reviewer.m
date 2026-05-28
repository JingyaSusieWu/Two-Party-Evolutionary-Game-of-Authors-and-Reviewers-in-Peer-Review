% ParameterSensibility_Reviewer.m
%
% Purpose:
%   Performs parameter sensitivity analysis for reviewer-related incentive
%   parameters in the two-party evolutionary game between authors and reviewers.
%
% Description:
%   This script solves the replicator dynamic system under multiple parameter
%   settings. Each parameter setting generates one time-series plot showing
%   the evolutionary trajectories of authors and reviewers.
%
% Required file:
%   AR_PS.m
%
% MATLAB version:
%   MATLAB R2021b


% Main Program
clc;clear;%% Clear the command window and workspace.

% -------------------------------------------------------------------------
% Parameter settings
% Each row represents one simulation scenario.
%
% Columns:
%   B, F, W1, W2, c1, c2, e1, e2
%
% To add a new scenario, add one more row to param_sets.
% -------------------------------------------------------------------------
param_sets = [
    2, 2, 2, 2, 5, 2, 4, 1;
    2, 2, 4, 2, 5, 2, 4, 1;
    2, 2, 2, 4, 5, 2, 4, 1;
    2, 2, 4, 4, 5, 2, 4, 1;
    2, 2, 5, 5, 5, 2, 4, 1
];

% Time span and initial values
tspan = [0,10];
initial_state = [0.5,0.5];

% -------------------------------------------------------------------------
% Run simulations under different parameter settings
% -------------------------------------------------------------------------
for k = 1:size(param_sets,1)

    % Extract one parameter setting
    B  = param_sets(k,1);
    F  = param_sets(k,2);
    W1 = param_sets(k,3);
    W2 = param_sets(k,4);
    c1 = param_sets(k,5);
    c2 = param_sets(k,6);
    e1 = param_sets(k,7);
    e2 = param_sets(k,8);

    % Solve the replicator dynamic system
    [t,y]=ode45(@(t,y) AR_PS(t,y,B,c1,c2,F,e1,e2,W1,W2),tspan,initial_state);

    % Plot the evolutionary trajectories
    figure;
    plot(t,y(:,1),'r-', 'lineWidth',1.5); hold on;
    plot(t,y(:,2),'b--', 'lineWidth',1.5);

    grid on;
    set(gca,'XTick',[0:1:10],'YTick',[0:0.1:1])
    %set(gca,'FontSize',12,'FontWeight','bold');
    axis([0 10 0 1]) % Set the ranges of the horizontal and vertical axes
    xlabel('t');
    ylabel('probability (m/n)');

    legend('Author', 'Reviewer');

    % Add a title indicating the parameter setting used in this figure
    title(['B=',num2str(B), ...
           ', F=',num2str(F), ...
           ', W1=',num2str(W1), ...
           ', W2=',num2str(W2), ...
           ', c1=',num2str(c1), ...
           ', c2=',num2str(c2), ...
           ', e1=',num2str(e1), ...
           ', e2=',num2str(e2)]);

end
