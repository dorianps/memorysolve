memorysolve
===========

A tool to provide estimates of recollection and familiarity from 6 (or 4) point confidence responses.

========================================================

This tool provdes estimates of recollection and familiarity from 6 (or 4) point confidence responses. The original solving
formula is taken from DPSDSSE.xls (see Andrew Yonelinas page):
http://psychology.ucdavis.edu/labs/Yonelinas/section_1_5.html

Usage:
[familiarity recollection] = memorysolve(x)
where x is the matrix of false alarm and hit columns like in the Excel sheet (columns 'far' and 'hit')
The output is given in two variables that you can use in your scripts
 
The solver is performed 50 times with randomized initial values.
The output is the median of all estimates, avoiding inaccurate results appearing occasionally.


