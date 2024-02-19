function [] = detailed_output(t,dt,solution_coeffs,k1,k2,k3,k4)
    if t < 10*dt
         basefn = strcat(num2str(t),'.txt');
         solcoef_fn = strcat('solcoef_',basefn);
         dlmwrite(solcoef_fn,solution_coeffs,'delimiter','\t','precision','%25.15e');
         k1_fn = strcat('k1_',basefn);
         k2_fn = strcat('k2_',basefn);
         k3_fn = strcat('k3_',basefn);
         k4_fn = strcat('k4_',basefn);
         dlmwrite(k1_fn,k1,'delimiter','\t','precision','%25.15e');
         dlmwrite(k2_fn,k2,'delimiter','\t','precision','%25.15e');
         dlmwrite(k3_fn,k3,'delimiter','\t','precision','%25.15e');
         dlmwrite(k4_fn,k4,'delimiter','\t','precision','%25.15e');
    end
end

