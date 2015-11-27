#!/bin/octave -q

addpath('student');

% Init data
m=3;
n=ceil(rand(1,1)*100);
x = linspace(1, n, n);
y = rand(1,n)*30;

a = polyfit(x,y,m);
a2 = fliplr(poly_regress(x,y,m)');

if length(a) ~= length(a2)
    fprintf('The length of vector a is not the expected one...Check your matrices.');
    exit(1);
end

msg='';
error=0;
for i=1:1:length(a2)
	fprintf('a_%d : expected : %f, got : %f\n', i-1, a(i), a2(i));
    if a(i)-a2(i) > 0.001
    	error = 1;
    end
end

if error == 1
	exit(1);
end

exit(0);