clc; clear;

load('inject.mat', 't_c');
load('inject.mat', 'iosT');

R = [0.01, 0.02 0.04 0.08 0.25 0.4 0.01, 0.02 0.04 0.08 0.25 0.4 0.01, 0.02 0.04 0.08 0.25 0.4 0.01, 0.02 0.04 0.08 0.25 0.4];

L = ones(length(t_c), 300);
for indexO = 1: length(t_c)
    for indexI = 1: length(t_c{indexO})
        L(indexO, indexI) = contourLplot(iosT{indexO, indexI}, 1, R(indexO));
    end
end
