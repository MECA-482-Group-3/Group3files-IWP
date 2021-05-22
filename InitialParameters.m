clear all;
clc;
format compact;
%Initial Paramters/Varaiables
R=4.172
km=0.00775
Umax=18
g=9.81
mgl=0.12597;
mbg=mgl
d11=0.0014636
d12=0.0000076
d21=d12
d22=d21
J= (d11*d22-d12*d21)/d12
D=[d11 d12;d21 d22]
Di=inv(D);
di11=Di(1,1)
di12=Di(1,2)
di21=Di(2,1)
di22=Di(2,2)

% State Space Equation Parameters
A=[0 1 0;di11*mbg 0 0;di21*mbg 0 0]
B=[0;di12*km/R;di22*km/R]
%Observe all system parameters
C = eye(size(A))
%System does not have contain feedforward
D = zeros(size(C,1),size(B,2))

% Determine Controlablity
disp('Is system controllable?');
controllability=ctrb(A,B);
if rank(controllability) == size(controllability)
disp('Yes.');
else
disp('No.');
end

% Desired closed-loop eigenvalues
lambda1= -9.27 + 20.6i
lambda2= -9.27 - 20.6i
lambda3= -0.719
Vp=[lambda1 lambda2 lambda3]
K = place(A,B,Vp)

% Verifying closed-loop eigenvalues
% Variance of system
Vp_=eig(A-B*K)

sys = ss(A,B,C,D)

%End of Code
