%{
Author: Uriel Yafté Sánchez Almaguer
Group Number = 8

In this script the following instructions are solved.

1. Find a formula for the numerical derivative of a function f(x) whose error is of the order h^4, 
where h is the step size. 
Hint: Approximate f′(x) using the values f(x±h) and f(x±2h).

Write a MATLAB program that prints a table with:
• the asymmetric derivative formula discussed in class,
• the symmetric (central) derivative formula discussed in class,
• the new fourth-order formula derived above,
for step sizes
h= 10e−1,10e−2,...,10e−10,

taking the case
f(x) = cos(x) at x = 1,
and for another case of your choice.
%}

help ex13 
format long


% Here I tried to do the function bit I had some issues. I would like to
% receive comments about this section please :)

function fun = AsymmDer(f, x, h)
    fun = f(x + h) - f(x) ./ h;
end

function fun = SymmDer(f, x, h)
    fun = f(x + h) - f(x - h) ./ 2*h;
end

function fun = FourthOrd(f, x, h) 
fun = f(x + 2*h) - f(x - 2*h) + 2*(f(x + h) - f(x - h) ./ 2*(h^3));
end


%{
+ Deduction 

If we consider a remainder of the order O(h^4) we will take the Taylor
expansion from left and right at f''':

f(x+h) ~ f(x) + f'(x)h + f''(x)h^2/2! + f'''(x)h^3/3! + O(h^4)......(1)
f(x-h) ~ f(x) - f'(x)h + f''(x)h^2/2! - f'''(x)h^3/3! + O(h^4)......(2) 

We calculate (1) - (2)

f(x+h) - f(x-h) = 2f'(x)h + f'''(x)h^3/3......(3)

Following the given hint we calculate the expansion of f(x+2h):

f(x+2h) ~ f(x) + 2f'(x)h + f''(x)h^2 + f'''(x)(2h)^3/3 + O(h^4)......(4)
f(x-2h) ~ f(x) - 2f'(x)h + f''(x)h^2 - f'''(x)(2h)^3/3 + O(h^4)......(5)

We calculate (3) - (4) 

f(x+2h) - f(x-2h) = 4f'(x)h + 8/3 f(x)'''h^3......(6)


We want to get rid off f'''(x) and only leave f'(x) in terms of f() so now, we calculate 8(3)-(6):

f'(x) = 8[f(x+h) - f(x-h)] - [f(x+2h) - f(x-2h)] / 12*h ......(7)

Which is our final expression.

%}



% Function and Exact Solution %
f = @(x) cos(x);
dex = -sin(1);

% Values Case 1 %
h = 10.^(-[1:10]); % Step Sizes %
x = 1; 


asym  = (cos(x + h) - cos(x))./h; % Asymmetric Method
sym = (cos(x + h) - cos(x - h))./(h+h); % Symmetric Method
ord_4 = ((cos(x+h) - cos(x-h)).*8 - (cos(x+h.*2)-cos(x-h.*2)))./((h.*12)); % 4th Order Method

asym_error = abs((asym - dex) / dex); % Asymmetric Error
sym_error = abs((sym - dex) / dex); % Symmetric Error
ord_4_error = abs((ord_4 - dex) / dex); % 4th Order Method Error


% We put the values on both different an array. 

sol1 = [h ; asym ; sym ; ord_4]; % Solution Array

errors = [h ; asym_error ; sym_error ; ord_4_error]; % Errors Array


% We print the values of approximation and errors. %

fprintf('               ******** Aproximation Case 1 ********               \n')
fprintf('   h       asymmetric.      symmetric.       ord 4. \n \n');
fprintf('   %5.0e   %10.5e      %10.5e      %10.5e \n', sol1);

fprintf('\n\n\n               ******** Errors Case 1 ********               \n')
fprintf('   h       asymmetric.      symmetric.       ord 4. \n \n');
fprintf('   %5.0e   %10.2e      %10.2e      %10.2e \n', errors);


% Values Case 2 (of my choice)%

% We will use the same values for h but now we change the values of x to
% x = pi/2 which we now the result -sin(pi/2) = -1

h = 10.^(-[1:10]); % Step Sizes % 
x1 = pi/2; 

asym2  = (cos(x1 + h) - cos(x1))./h;
sym2 = (cos(x1 + h) - cos(x1 - h))./(h+h);
ord_4_2 = ((cos(x1+h) - cos(x1-h)).*8 - (cos(x1+h.*2)-cos(x1-h.*2)))./((h.*12));

asym_error_2 = abs((asym2 - dex) / dex);
sym_error_2 = abs((sym2 - dex) / dex);
ord_4_error_2 = abs((ord_4_2 - dex) / dex);

sol2 = [h ; asym2 ; sym2 ; ord_4_2];
errors2 = [h ; asym_error_2 ; sym_error_2 ; ord_4_error_2]; 

fprintf('\n \n')
fprintf('               ******** Aproximation Case 2 ********               \n')
fprintf('   h       asymmetric.      symmetric.       ord 4. \n \n');
fprintf('   %5.0e   %10.5e      %10.5e      %10.5e \n', sol2);

fprintf('\n\n\n               ******** Errors Case 2 ********               \n')
fprintf('   h       asymmetric.      symmetric.       ord 4. \n \n');
fprintf('   %5.0e   %10.2e      %10.2e      %10.2e \n', errors2);
fprintf('\n\n');


%{
As we observe in both cases, the fourth order method converges quickly to a
high accuracy approximation. It reaches the most precise value of all on
the fourth h-step. Comparing with the other methods this reach the high
value error of 3.63e-14 while the symm method reaches 1.29e-11 on the
fourth step. Both reach their minimum error value at the same step but the
quality of approximation of the 4th Order one is better. 
This is because we are considering more elements of the Taylor Series.
%}


%{
2. Write a MATLAB script that generates a plot for the three approximations of the derivative
considered in Exercise 1.3.
• On the y-axis: the absolute value δ of the relative error between the numerical and the
true derivative.
• On the x-axis: the step size h.
• Use logarithmic scales for both axes.
Comment on what you observe in the plot.
%}


% Plotting routines for each case %

figure;
plot(log(errors(1, :)), log(errors(2, :)))
grid on
xlabel('log(step size (h))')
ylabel('log(|δ|)')
title('h v.s |δ| (Asymmetric)')

figure;
plot(log(errors(1, :)), log(errors(3, :)))
grid on
xlabel('step size (h)')
ylabel('|δ|')
title('h v.s |δ| (Symmetric)')

figure;
plot(log(errors(1, :)), log(errors(4, :)))
grid on
xlabel('step size (h)')
ylabel('|δ|')
title('h v.s |δ| (4th-Order)')
%{
Comments about this figure:

As we can observe on the graphs there are some minimum values and each
method reach them at different h values. 
We can look on the figure 3 that the 4-th order method reaches his minimum
value first than the other two methods. Here can be validated the
statements we discuss on the exercise 1.3.
%}



%{
1.5 Assuming a relation:

                        δ(h) = c * h * α

for the relative error of the approximations of Exercise 1.3, determine by hand a value for the
exponent α and the constant c using

                        h = 10−1 and h = 10−2

for the three approximations.

Do the values of α coincide with what one would expect? Justify your answer.


%}


%{
Computing by hand:

Let's consider δ_1(h_1) and δ_2(h_2) and calculate the cocient:

δ_1(h_1) / δ_2(h_2) = (h_1/h_2)^α => 

α = log(δ_1/δ_2)/log(h_1/h_2)......(1)

and for C 

δ(h) = ch^(α) => 

c = δ(h) / h^(α)......(2)

%}



h1 = h(1); % h = 1e-1
h2 = h(2); % h = 1e-2

delta1 = errors(2, 1:2);
delta2 = errors(3, 1:2);
delta3 = errors(4, 1:2);


alpha1 = (log(delta1(1) ./ delta1(2)))/(log(h1/h2)); % For Assymetric
alpha2 = (log(delta2(1) ./ delta2(2)))/(log(h1/h2)); % For Symmetric
alpha3 = (log(delta3(1) ./ delta3(2)))/(log(h1/h2)); % For 4th-Order

c1 = delta1./h1.^(alpha1);
c2 = delta2./h1.^(alpha2);
c3 = delta3./h1.^(alpha3);


disp('          α_1                 α_2                 α_3')
disp([alpha1, alpha2, alpha3])

disp('                      c_1                         c_2                             c_3')
disp([c1 , c2 , c3])
