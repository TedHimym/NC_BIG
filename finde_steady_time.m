clear; clc;

global t_c theta

load('theta_mU.mat', 'theta')
load('inject.mat'  ,   't_c')

t_c = cell2mat(t_c);

steady_time = zeros(size(t_c,1), 1);

for index = 1: size(t_c, 1)
    fprintf('File Number is %.3d', index)
    lhs = min(t_c(index,:));
    rhs = 30;
    steady_time(index) = gold_split(lhs, rhs, index);
    fprintf('\n')
end

plot(t_c', theta')
% hold on
% plot(steady_time, )

save('steady_time.mat', 'steady_time')

function nf = nigtave_f(t, index)
global t_c theta
nf = interp1(t_c(index,:), theta(index,:), t, 'linear');
end

function x = gold_split(a, b, index)
% fprintf(' |%.3f,%.3f|',a,b)
fprintf(' |%.3f,%.3f|', a, b)
if (abs(a-b) < 0.01)
    x = (a+b)/2;
    return;
end

rhs = a + 0.618*(b -a);
lhs = b - 0.618*(b -a);

% global t_c theta
% clf
% plot(t_c(index,:), theta(index,:))
% hold on
% plot([a lhs rhs b], [nigtave_f(a, index) nigtave_f(lhs, index) nigtave_f(rhs, index) nigtave_f(b, index)], 'o')
% pause

if (nigtave_f(lhs, index) > nigtave_f(rhs, index))
    x = gold_split(a, rhs, index);
else
    x = gold_split(lhs, b, index);
end
end