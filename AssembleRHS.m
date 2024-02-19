function RHS = AssembleRHS( solution_coeffs, L, J,t ,rk_step)
  N = fix(size(solution_coeffs,1)/2)
  r = solution_coeffs(1:N);    
  v = solution_coeffs(N+1:2*N);
  r = r + L*(r<0) - L*(r>L);
  % Calculate electron number density
  ne = GetDensity( r, L, J,t );
  % Solve Poisson's equation
  n0 = N/L;
  rho = ne/n0 - 1;
  phi = Poisson1D( rho, L );
  [u1D] = mit18086_poisson(L,J,rho)
%   [u1D,K1D,f1D,u2D,K2D,f2D,u3D,K3D,f3D] = mit18086_poisson(J);
%   u1D = K1D\rho;
  if rk_step == 1
     drawPhiRho(phi,rho,t)
     figure
     plot(u1D)
     title(strcat('solution of linear system, t = %e',t))
  end
  % Calculate electric field
  E = GetElectric( phi, L );
  % equations of motion
  dx = L/J;
  js = floor(r/dx)+1;
  ys = r/dx - (js-1);
  js_plus_1 = mod(js,J)+1;
  Efield = E(js).*(1-ys) + E(js_plus_1);
  dlmwrite('ef.txt',Efield,'precision','%15.5e','delimiter','\n');
  rdot = v;
  vdot = -Efield;
  RHS = [rdot; vdot];
end