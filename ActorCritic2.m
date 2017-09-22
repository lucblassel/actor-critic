%%%%% parcours simple avec politique évolutive %%%%%
function [V,PI] = ActorCritic2(eta,eta2,gamma,beta,N,i,PI,V,R)


 %%% politique pour la gauche 




Q = zeros(2,3); %%% valeur des actions



for k = 1:N-1
    x = rand; 
    y = rand;
  
    if (x < PI(k,1,i)) %%% choix d'aller dans l'état B
        
        if (y < PI(k,2,i)) %%% choix d'aller en D
            
            Q(1,2) = Q(1,2) + eta2*(R(1,2) - V(k,2,i)) ;
            V(k+1,2,i) = V(k,2,i) + eta*(R(1,2)-V(k,2,i));
            
             
            PI(k+1,2,i) = exp(beta*Q(1,2))/( exp(beta*Q(1,2)) + exp(beta*Q(2,2)) );
        else             %%% choix d'aller en E
            Q(2,2) = Q(2,2) + eta2*(R(2,2)-V(k,2,i)) ;
            V(k+1,2,i) = V(k,2,i) + eta*(R(2,2)-V(k,2,i));
            
            PI(k+1,2,i) = 1 - (exp(beta*Q(2,2))/( exp(beta*Q(1,2)) + exp(beta*Q(2,2)) )); %%% on actualise pigauche. 
        end
        %%% mise à jour de V(A) et q(a,s)
        Q(1,1) = Q(1,1) + eta2*(R(1,1) + gamma*V(k,2,i) - V(k,1,i)) ;
        V(k+1,1,i) = V(k,1,i) + eta*(R(1,1) + gamma*V(k,2,i) - V(k,1,i));
        
        PI(k+1,1,i) = exp(beta*Q(1,1))/( exp(beta*Q(1,1)) + exp(beta*Q(2,1)) );
        PI(k+1,3,i) = PI(k,3,i); %%% on conserve la politique qui n'a pas été changée
        V(k+1,3,i)=V(k,3,i);
        
    else                 %%%% choix d'aller en C 
        
        if (y < PI(k,3,i)) %%% choix d'aller en F
            Q(1,3) = Q(1,3) + eta2*(R(1,3)-V(k,3,i)) ;
            V(k+1,3,i) = V(k,3,i) + eta*(R(1,3)-V(k,3,i)); 
             
            PI(k+1,3,i) = exp(beta*Q(1,3))/( exp(beta*Q(1,3)) + exp(beta*Q(2,3)) );
        else             %%% choix d'aller en G
            Q(2,3) = Q(2,3) + eta2*(R(2,3)-V(k,3,i)) ;
            V(k+1,3,i) = V(k,3,i) + eta*(R(2,3)-V(k,3,i));
            
            PI(k+1,3,i) = 1 - (exp(beta*Q(2,3))/( exp(beta*Q(1,3)) + exp(beta*Q(2,3)) ));
        end
         Q(2,1) = Q(2,1) + eta2*(R(2,1) + gamma*V(k,3,i) - V(k,1,i)) ;

         V(k+1,1,i) = V(k,1) + eta*(R(2,1) + gamma*V(k,3,i) - V(k,1,i)); 
         
         PI(k+1,1,i) = 1 - ( exp(beta*Q(2,1))/( exp(beta*Q(1,1)) + exp(beta*Q(2,1))));
         
         PI(k+1,2,i) = PI(k,2,i);
         V(k+1,2,i)=V(k,2,i);
 
    end
    
end


        
        
