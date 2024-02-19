function [] = drawPhiRho(phi,rho,t)

figure
tit = 'Potential for t = ';
tit = strcat(tit,num2str(t));

subplot(2,1,1);
plot(phi)
title(tit)

subplot(2,1,2);
plot(rho)
tit = 'Density for t = ';
tit = strcat(tit,num2str(t));
title(tit)

fname = strcat(strcat('phi_rho_',num2str(t)),'.png')
saveas(gcf,fname)

fname = strcat(strcat('phi_rho_',num2str(t)),'.txt')
fid = fopen(fname,'wt')

for i = 1:size(phi,1)
    fprintf(fid,'%25.15e %25.15e\n',rho(i),phi(i))
end
fclose(fid)

end

