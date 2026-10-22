%{
Write a MATLAB program that determines the smallest numbers
e2 = 2−n1 , e10 = 10−n2
such that
1 + ei̸ = 1 (i = 2, 10).
After computing e2 and e10, compare their values to the predefined MATLAB quantity eps.
The program should perform the calculation and display the results for
n1, n2, 2−n1 , 10−n2 ,
and the comparison with eps.

decraese e until adding it to 1 no longer changes the result
%}

n1 = 0;
while 1 + 2^-(n1+1) ~= 1
    n1 = n1 + 1;
end
e2 = 2^-n1;

n2 = 0;
while 1 + 10^-(n2+1) ~= 1
    n2 = n2 + 1;
end
e10 = 10^-n2;

fprintf('n1 = %d\n', n1)
fprintf('n2 = %d\n\n', n2)

fprintf('e2  = %e\n', e2)
fprintf('eps = %e\n', eps)
fprintf('e2  / eps = %g\n\n', e2 / eps)

fprintf('e10 = %e\n', e10)
fprintf('eps = %e\n', eps)
fprintf('e10 / eps = %g\n\n', e10 / eps)

% comparison: e2 is exactly equal to eps, e10 is about 4.5 times larger