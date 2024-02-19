function n = GetDensity( r, L, J,t )
% Evaluate number density n in grid of J cells, length   L, from the electron positions r

  dx = L/J;

  js = floor(r/dx)+1;

  dlmwrite(sprintf('js%5f.txt',t),js,'precision','%25.15e','delimiter','\n');
  ys = r/dx - (js-1);
  dlmwrite(sprintf('ys%5f.txt',t),ys,'precision','%25.15e','delimiter','\n');
  js_plus_1 = mod(js,J)+1;
  dlmwrite(sprintf('js_plus_1_%5f.txt',t),js_plus_1,'precision','%25.15e','delimiter','\n');
  n1 = accumarray(js,(1-ys)/dx,[J,1]);
  dlmwrite(sprintf('n1_m_%5f.txt',t),n1,'precision','%25.15e','delimiter','\n');
  dlmwrite(sprintf('ys_ds_%5f.txt',t),ys/dx,'precision','%25.15e','delimiter','\n');
  dlmwrite(sprintf('1_m_ys_ds_%5f.txt',t),(1-ys)/dx,'precision','%25.15e','delimiter','\n');
  % dlmwrite('js.txt',js,'precision','%15d','delimiter','\n');
  % dlmwrite('js_plus_1.txt',js_plus_1,'precision','%15d','delimiter','\n');
 % dlmwrite('ys_dx.txt',ys/dx,'precision','%25.15e','delimiter','\n');
  n2 = accumarray(js_plus_1,ys/dx,[J,1]);
  dlmwrite(sprintf('n2_m_%5f.txt',t),n2,'precision','%25.15e','delimiter','\n');
  n = accumarray(js,(1-ys)/dx,[J,1]) + ...
      accumarray(js_plus_1,ys/dx,[J,1]);
  n1 = accumarray(js,(1-ys)/dx,[J,1]);
  dlmwrite(sprintf('n1_m_%5f.txt',t),n1,'precision','%25.15e','delimiter','\n');
  dlmwrite(sprintf('n_m_%5f.txt',t),n,'precision','%25.15e','delimiter','\n');
end