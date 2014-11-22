function [familiarity recollection] = MemorySolve(x);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This tool provdes estimates of recollection and familiarity
%% from 6 (or 4) point confidence responses. The original solving
%% formula is taken from DPSDSSE.xls (see Yonelinas page):
%% http://psychology.ucdavis.edu/labs/Yonelinas/section_1_5.html
%%
%% Usage:
%%     [familiarity recollection] = memorysolve(x)
%% where x is the matrix of false alarm and hit columns like in
%% the Excel sheet (columns 'far' and 'hit')
%% The output is given in two variables that you can use in your scripts
%% 
%% The solver is performed 50 times with randomized initial values.
%% The output is the median of all estimates, avoiding inaccurate results appearing occasionally.
%%
%% Requirements: fajconstrain.m  fajsolver4.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global hit far;



%% initial values of Yonelinas excel sheet published online:
%% 1-dprime 2-ro 3:7-c
% x0 = [0.4007;    0.2754;    0.5451;   -0.0006;   -0.4962;   -1.0481;   -1.7079];
%%% wrong initial values that brings to wrong results
% x0 = [0.200030966; 0.686109456; -1.325337744; -1.418262376; -1.418257711; -5.133721757; -4.862621929]


far = x(:,1);
hit = x(:,2);

options = optimset('Display','notify', 'Largescale', 'off', 'MaxIter', 32000, 'Tolcon', 0.01, 'TolFun', 0.00000000001, 'TolX', 0.0001, 'MaxFunEvals', 32000);
% TolFun = the minmum value of our function that terminates the iterations
% Tolcon = maximum difference allowed from constrained value
% TolX = minimum change of X that doesn't make a difference after some iterations


%%%%%%%%%%%%%%%% do 50 iterations and get the median results (most probably accurate)
clear temp;
famlist = [];
reclist = [];
for i= 1:50
	x0 = rand(7,1);
	[temp,fval,exitflag,output] = fmincon('fajsolver4',x0,[],[],[],[],[],[],'fajconstrains', options);

	famlist = [famlist; temp(1)];
	reclist = [reclist; temp(2)];

end;


familiarity = median(famlist);
recollection = median(reclist);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%