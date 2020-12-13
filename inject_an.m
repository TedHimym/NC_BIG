clc; clear;

load('inject.mat', 't_c');
load('inject.mat', 'iosT');
load theta_mU.mat
load const_v.mat

R = [0.01, 0.02 0.04 0.08 0.25 0.4 0.01, 0.02 0.04 0.08 0.25 0.4 0.01, 0.02 0.04 0.08 0.25 0.4 0.01, 0.02 0.04 0.08 0.25 0.4];

L = ones(length(t_c), 300);
for indexO = 1: length(t_c)
    for indexI = 1: length(t_c{indexO})
        L(indexO, indexI) = contourLplot(iosT{indexO, indexI}, 1, R(indexO));
    end
end

% T = cell2mat(t_c);
% plot(T', L')

hold on
for indexd = 1:length(t_c)
    time = t_c{indexd};
    eL = L(indexd, :);
    uin_d_1 = (R(indexd)+eL).*(eL.^3)./(mU(indexd).*theta(indexd).*(g(indexd)*0.0016*7).*(R(indexd)+theta(indexd).*0.1));
%     uin_d_1 = (R(indexd)+eL).*(eL.^3)./(mU(indexd).*theta(indexd).*(g(indexd)*0.0016*7).*(R(indexd)+theta(indexd).*0.15));
    plot(time, power(uin_d_1, 1/3), '.')
end