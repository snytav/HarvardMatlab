function [v] = double_maxwellian(N,vb)
v1 = normrnd(-vb,1,[1,N/2])
v2 = normrnd(vb,1, [1,N/2])

v = [v1 v2]

v = v'
end

