steady_time = zeros(size(VFile));

global SFile

for index = 1: length(VFile)
    fprintf('File Number is %.3d', index)
    SFile = VFile{index};
    lhs = min(SFile.TimeList);
    rhs = max(SFile.TimeList);
    steady_time(index) = gold_split(lhs, rhs);
    fprintf('\n')
end

save('steady_time.mat', 'steady_time')

function nf = nigtave_f(t)
global SFile
nf = -SFile.TBL_TR(0.5, t);
end

function x = gold_split(a, b)
% fprintf(' |%.3f,%.3f|',a,b)
fprintf(' |%.3f,%.3f|', a, b)
if (abs(a-b) < 0.01)
    x = (a+b)/2;
    return;
end

lhs = a + 0.618*(b -a);
rhs = b - 0.618*(b -a);

if (nigtave_f(lhs) > nigtave_f(rhs))
    x = gold_split(a, rhs);
else
    x = gold_split(lhs, b);
end
end