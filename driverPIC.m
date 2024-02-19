L = 100;    % domain of solution 0 <= x <= L
N = 20000;  % number of electrons
J = 1000;   % number of grid points
vb = 3;     % beam velocity
dt = 0.1;   % time-step (in inverse plasma frequencies)
tmax = 80;  % simulation run from t = 0 to t = tmax

%initialize solution
t = 0;
%rng(42);                     % seed the rand # generator
r = L*rand(N,1);             % electron positions
dlmwrite('0R.txt',r,'delimiter','\n','precision','%25.15e');
ne = GetDensity( r, L, J,-0.5 );
dlmwrite('NE.txt',ne,'delimiter','\n','precision','%25.15e');
 
%fid = fopen('data.txt', 'w+');
%fprintf(fid,'%25.15e\n',r(1));
%fclose(fid);
v = double_maxwellian(N,vb); % electron velocities
dlmwrite('0V.txt',r,'delimiter','\n','precision','%25.15e');
qq = 0;

while (t<=tmax)
    % load r,v into a single vector
    solution_coeffs = [r; v];
    % take a 4th order Runge-Kutta timestep
    k1 = AssembleRHS(solution_coeffs,L,J,t,1);
    fname=sprintf("k1_coef%010f.txt",t);
    dlmwrite(fname,r,'delimiter','\n','precision','%25.15e');
    k2 = AssembleRHS(solution_coeffs + 0.5*dt*k1,L,J,t,2);
    k3 = AssembleRHS(solution_coeffs + 0.5*dt*k2,L,J,t,3);
    k4 = AssembleRHS(solution_coeffs + dt*k3,L,J,t,4);
    solution_coeffs = solution_coeffs + dt/6*(k1+2*k2+2*k3+k4);
end