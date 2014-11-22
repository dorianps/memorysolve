function y = fajsolver4(x);
global hit far;

dpri = x(1);
ro = x(2);

if (size(hit,1) == 5) c = x(3:7); end;
if (size(hit,1) == 3) c = x(3:5); end;

oldvar = 1;
rn = 0;


predhit = (1-ro).*(normcdf(c,-dpri,oldvar))+ro;
predfar = (normcdf(c,rn,oldvar));
sqdiffhit = (hit-predhit).*(hit-predhit);
sqdifffar = (far-predfar).*(far-predfar);
y = sum(sqdiffhit)+sum(sqdifffar);

%y = sum((hit-((1-ro).*(normcdf(c,-dpri,oldvar))+ro)).*(hit-((1-ro).*(normcdf(c,-dpri,oldvar))+ro)))+sum((far-((1-rn).*(normcdf(c,rn,oldvar)))).*(far-((1-rn).*(normcdf(c,rn,oldvar)))));

%y = sum((hit-((1-ro).*(normcdf(c,-dpri,oldvar))+ro)).*(hit-((1-ro).*(normcdf(c,-dpri,oldvar))+ro)))+sum((far-((1-rn).*(normcdf(c,0,1)))).*(far-((1-rn).*(normcdf(c,0,1)))));