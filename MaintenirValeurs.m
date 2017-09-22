function [ V,PI ] = MaintenirValeurs( V,PI,i,point,k )

PI(k+1,point,i) = PI(k,point,i);  % A.Q.T 
V(k+1,point,i)=V(k,point,i);

end

