function [A, beq] = fajconstrains(x)

dpri = x(1);
ro = x(2);

A = [-dpri;-ro];
beq = [];