 function E = GetElectric( phi, L ) 
     % Calculate electric field from potential 
     J = length(phi); 
     dx = L/J; % 
%      E(j) = (phi(j-1) - phi(j+1)) / (2*dx) 
     E = (circshift(phi,1)-circshift(phi,-1))/(2*dx); 
 end