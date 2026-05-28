% Purpose:
%   Symbolically computes the Jacobian matrix of the two-dimensional
%   replicator dynamic system for the author-reviewer evolutionary game.
%
% Description:
%   This script defines the replicator dynamic equations of authors and
%   reviewers, computes the partial derivatives with respect to the two
%   state variables, constructs the Jacobian matrix, and evaluates the
%   Jacobian matrix at the boundary equilibrium points and the internal
%   equilibrium point.
%
% State variables:
%   x - Probability or proportion of authors choosing the first strategy.
%   y - Probability or proportion of reviewers choosing the first strategy.
%
% Output:
%   dxx      - Partial derivative of dx with respect to x.
%   dxy      - Partial derivative of dx with respect to y.
%   dyx      - Partial derivative of dy with respect to x.
%   dyy      - Partial derivative of dy with respect to y.
%   Jacobian - Symbolic Jacobian matrix of the replicator dynamic system.
%   A1       - Jacobian matrix evaluated at equilibrium point (0,0).
%   A2       - Jacobian matrix evaluated at equilibrium point (1,0).
%   A3       - Jacobian matrix evaluated at equilibrium point (0,1).
%   A4       - Jacobian matrix evaluated at equilibrium point (1,1).
%   A5       - Jacobian matrix evaluated at the internal equilibrium point.
%
% MATLAB version:
%   MATLAB R2021b


% Declare symbolic variables
syms x y B c1 c2 F P e1 e2 W1 W2


% Define the replicator dynamic system
dx=-x*(x - 1)*(c2 - c1 + B*y + F*y);
dy=-y*(y - 1)*(W2 - e1 + e2 + W1*x - W2*x);


% Compute the partial derivatives of the replicator dynamic equations
dxx=diff(dx,x)
dxy=diff(dx,y)

dyx=diff(dy,x)
dyy=diff(dy,y)


% Construct the Jacobian matrix
Jacobian=[[dxx, dxy];[dyx, dyy]];


% Evaluate the Jacobian matrix at the boundary equilibrium points

% Equilibrium point E1: (0,0)
x = 0;
y = 0;
A1=eval(Jacobian)

% Equilibrium point E2: (1,0)
x = 1;
y = 0;
A2=eval(Jacobian)

% Equilibrium point E3: (0,1)
x = 0;
y = 1;
A3=eval(Jacobian)

% Equilibrium point E4: (1,1)
x = 1;
y = 1;
A4=eval(Jacobian)


% Evaluate the Jacobian matrix at the internal equilibrium point

% Internal equilibrium point E5: (m0,n0)
m0 = (e1 - e2 - W2)/(W1 - W2);
n0 = (c1 - c2)/(B + F);

% Substitute x = m0 and y = n0 into the Jacobian matrix
x = m0;
y = n0;
A5=eval(Jacobian)
