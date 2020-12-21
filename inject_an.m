clc; clear;

load('inject.mat', 't_c');
load('inject.mat', 'iosT');
load theta_mU.mat
load const_v.mat
load('steady_time.mat', 'steady_time')

L = ones(length(t_c), 300);
for indexO = 1: length(t_c)
    for indexI = 1: length(t_c{indexO})
        L(indexO, indexI) = contourLplot(iosT{indexO, indexI}, 1, R(indexO));
    end
end

% T = cell2mat(t_c);
% plot(T', L')

delta_ios = zeros(size(t_c));
for indexO = 1: length(t_c)
    delta_ios(indexO) = contourLplot_delta(iosT{indexO, length(t_c{indexO})}, 1, R(indexO));
end

hold on
U = mU(:,end);
for indexd = 1:length(t_c)
    time = t_c{indexd};
    eL = L(indexd, :);
    Q = (U(indexd).*delta_ios(indexd).*(R(indexd)+delta_ios(indexd).*0.15));
    uin_d_1 = (R(indexd)+eL).*(eL.^3)./(Q.*(g(indexd)*0.0016*7));
%     uin_d_1 = (R(indexd)+eL).*(eL.^3)./(mU(indexd).*theta(indexd).*(g(indexd)*0.0016*7).*(R(indexd)+theta(indexd).*0.15));
    plot(time./steady_time(indexd), power(uin_d_1, 1/3)./steady_time(indexd), '.')
end