%%%%% parcours simple sans politique %%%%%


R = [1,1,1 ; 2,4,1];

PI = [0.5 0.5 0.5 ; 0.5 0.5 0.5];

N = 100 ;
V = zeros(N,3);

eta = 0.3; 

gamma = 0.6;

for k = 1:N-1
    x = rand; 
    y = rand;
  
    if (x < PI(1,1)) %%% choix d'aller dans l'état B
  
        
        if (y < PI(1,2)) %%% choix d'aller en D
            V(k+1,2) = V(k,2) + eta*(R(1,2)-V(k,2));
        else             %%% choix d'aller en E
            V(k+1,2) = V(k,2) + eta*(R(2,2)-V(k,2));
        end
        %%% mise à jour de V(A) 
        V(k+1,1) = V(k,1) + eta*(R(1,1) + gamma*V(k,2) - V(k,1));
    else                 %%%% choix d'aller en C 
        if (y < PI(1,3)) %%% choix d'aller en F
            V(k+1,3) = V(k,3) + eta*(R(1,3)-V(k,3)); 
        else             %%% choix d'aller en G
            V(k+1,3) = V(k,3) + eta*(R(2,3)-V(k,3));
        end

         V(k+1,1) = V(k,1) + eta*(R(2,1) + gamma*V(k,3) - V(k,1)); 
         
    end
    
end
close;
figure(1)
 
k = [1:N] ;
plot(k,V(k,1), 'b');
hold on; 
plot(k,V(k,2), 'g');
hold on;
plot(k,V(k,3), 'r');
    
        
        
