% Purpose:
%   Symbolically derives the replicator dynamic equations for the
%   two-party evolutionary game between authors and reviewers.
%
% Description:
%   This script defines the expected payoffs of authors and reviewers under
%   different strategy choices and derives the corresponding replicator
%   dynamic equations using symbolic computation.
%
% State variables:
%   x - Probability or proportion of authors choosing the first strategy.
%   y - Probability or proportion of reviewers choosing the first strategy.
%
%
% Output:
%   fx - Simplified replicator dynamic equation for authors.
%   fy - Simplified replicator dynamic equation for reviewers.
%
% MATLAB version:
%   MATLAB R2021b


% -------------------------------------------------------------------------
% Replicator dynamic equation for authors
% -------------------------------------------------------------------------

syms x y B c1 c2 F P e1 e2 W1 W2 % Define symbolic variables and model parameters.

EA1=y*(B-c1)+(1-y)*(B-c1); % Expected payoff when authors choose the first strategy.
EA2=y*(-c2-F)+(1-y)*(B-c2); % Expected payoff when authors choose the second strategy.

dx=x*(1-x)*(EA1-EA2); % Replicator dynamic equation for authors.
fx=simplify(dx) % Simplify the authors' replicator dynamic equation.


% -------------------------------------------------------------------------
% Replicator dynamic equation for reviewers
% -------------------------------------------------------------------------

EA3=x*(P-e1+W1)+(1-x)*(P-e1+W2); % Expected payoff when reviewers choose the first strategy.
EA4=x*(P-e2)+(1-x)*(P-e2); % Expected payoff when reviewers choose the second strategy.

dy=y*(1-y)*(EA3-EA4); % Replicator dynamic equation for reviewers.
fy=simplify(dy) % Simplify the reviewers' replicator dynamic equation.
