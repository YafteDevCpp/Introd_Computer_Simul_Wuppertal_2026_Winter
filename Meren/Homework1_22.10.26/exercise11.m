%{
Write a MATLAB program that determines:
(i) the largest number of the form 2n1 that can be represented on the computer, where n1 is
a positive integer;
(ii) the smallest number of the form 2−n2 > 0 that can be represented on the computer, where
n2 is a positive integer.

we need to increase the exponent until the next power overflows or
underflows
%}

n1 = 0;
while ~isinf(2^(n1+1))
    n1 = n1 + 1;
end

n2 = 0;
while 2^-(n2+1) > 0
    n2 = n2 + 1;
end


fprintf('n1 = %d\n', n1)
fprintf('2^n1  = %e\n\n', 2^n1)

fprintf('n2 = %d\n', n2)
fprintf('2^-n2 = %e\n\n', 2^-n2)