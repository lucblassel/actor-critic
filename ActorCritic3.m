%%%%% parcours simple avec politique évolutive %%%%%
function [V,PI] = ActorCritic3(eta,eta2,gamma,beta,N,i,PI,V,R)


 %%% politique pour la gauche 




Q = zeros(2,7); %%% valeur des actions



for k = 1:N-1
    x = rand; 
    y = rand;
    z=rand;
  
    if (x < PI(k,1,i)) %%% choix d'aller dans l'état B
        
        
        %%%%%% CHOIX D'ALLER EN D 
        if (y < PI(k,2,i)) 
            
            if (z<PI(k,4,i)) %%% choix d'aller en H 
                Q(1,4) = Q(1,4) + eta2*(R(1,4) - V(k,4,i)) ;
                V(k+1,4,i) = V(k,4,i) + eta*(R(1,4)-V(k,4,i));
                PI(k+1,4,i) = exp(beta*Q(1,4))/( exp(beta*Q(1,4)) + exp(beta*Q(2,4)) );
                
            else %%% choix d'aller en I 
                Q(2,4) = Q(2,4) + eta2*(R(2,4)-V(k,4,i)) ;
                V(k+1,4,i) = V(k,4,i) + eta*(R(2,4)-V(k,4,i));
                PI(k+1,4,i) = 1 - (exp(beta*Q(2,4))/( exp(beta*Q(1,4)) + exp(beta*Q(2,4)) ));
            end
            %%% mise à jour de B     
            Q(1,2) = Q(1,2) + eta2*(R(1,2) + gamma*V(k,4,i) - V(k,2,i)) ;
            V(k+1,2,i) = V(k,2,i) + eta*(R(1,2) + gamma*V(k,4,i) - V(k,2,i));
            PI(k+1,2,i) = exp(beta*Q(1,2))/( exp(beta*Q(1,2)) + exp(beta*Q(2,2)) );
            
            PI(k+1,5,i) = PI(k,5,i); %%% maintenir la politique de E
            V(k+1,5,i)=V(k,5,i);  %%% maintenir la valeur de E
            
            
            
        %%%%%% CHOIX D'ALLER EN E 
        else    
            if (z<PI(k,5,i)) %%% choix d'aller en J 
                Q(1,5) = Q(1,5) + eta2*(R(1,5) - V(k,5,i)) ;
                V(k+1,5,i) = V(k,5,i) + eta*(R(1,5)-V(k,5,i));
                PI(k+1,5,i) = exp(beta*Q(1,5))/( exp(beta*Q(1,5)) + exp(beta*Q(2,5)) );
                
            else %%% choix d'aller en K
                Q(2,5) = Q(2,5) + eta2*(R(2,5)-V(k,5,i)) ;
                V(k+1,5,i) = V(k,5,i) + eta*(R(2,5)-V(k,5,i));
                PI(k+1,5,i) = 1 - (exp(beta*Q(2,5))/( exp(beta*Q(1,5)) + exp(beta*Q(2,5)) ));
            end
            %%% mise à jour de B     
            Q(1,2) = Q(1,2) + eta2*(R(1,2) + gamma*V(k,5,i) - V(k,2,i)) ;
            V(k+1,2,i) = V(k,2,i) + eta*(R(1,2) + gamma*V(k,5,i) - V(k,2,i));
        
            PI(k+1,2,i) = 1 - ( exp(beta*Q(2,2))/( exp(beta*Q(1,2)) + exp(beta*Q(2,2)) ));
            
            PI(k+1,5,i) = PI(k,5,i);  %%% maintenir la politique de D
            V(k+1,5,i)=V(k,5,i);  %%% maintenir la valeur de D
        end
        PI(k+1,3,i) = PI(k,3,i);  %%% maintenir la politique de C
        V(k+1,3,i)=V(k,3,i); %%% maintenir la valeur de C 
        PI(k+1,6,i) = PI(k,6,i);  %%% maintenir la politique de F
        V(k+1,6,i)=V(k,6,i); %%% maintenir la valeur de F
        PI(k+1,7,i) = PI(k,7,i);  %%% maintenir la politique de G
        V(k+1,7,i)=V(k,7,i); %%% maintenir la valeur de G
        
        
        %%%% mise à jour de A 
        Q(1,1) = Q(1,1) + eta2*(R(1,1) + gamma*V(k,2,i) - V(k,1,i)) ;
        V(k+1,1,i) = V(k,1,i) + eta*(R(1,1) + gamma*V(k,2,i) - V(k,1,i));
        
        PI(k+1,1,i) = exp(beta*Q(1,1))/( exp(beta*Q(1,1)) + exp(beta*Q(2,1)) );
    
    
        
        
        
    else   %%%% choix d'aller en C
        
        %%%%%% CHOIX D'ALLER EN F 
        if (y < PI(k,3,i)) 
            
            if (z<PI(k,6,i)) %%% choix d'aller en L
                Q(1,6) = Q(1,6) + eta2*(R(1,6) - V(k,6,i)) ;
                V(k+1,6,i) = V(k,6,i) + eta*(R(1,6)-V(k,6,i));
                PI(k+1,6,i) = exp(beta*Q(1,6))/( exp(beta*Q(1,6)) + exp(beta*Q(2,6)) );
                
            else %%% choix d'aller en M
                Q(2,6) = Q(2,6) + eta2*(R(2,6)-V(k,6,i)) ;
                V(k+1,6,i) = V(k,6,i) + eta*(R(2,6)-V(k,6,i));
                PI(k+1,6,i) = 1 - (exp(beta*Q(2,6))/( exp(beta*Q(1,6)) + exp(beta*Q(2,6)) ));
            end
            %%% mise à jour de C     
            Q(1,3) = Q(1,3) + eta2*(R(1,3) + gamma*V(k,6,i) - V(k,3,i)) ;
            V(k+1,3,i) = V(k,3,i) + eta*(R(1,3) + gamma*V(k,6,i) - V(k,3,i));
        
            PI(k+1,3,i) = exp(beta*Q(1,3))/( exp(beta*Q(1,3)) + exp(beta*Q(2,3)) );
            PI(k+1,7,i) = PI(k,7,i); %%% maintenir la politique de G
            V(k+1,7,i)=V(k,7,i);  %%% maintenir la valeur de G
   
            
            
            
         %%%%% CHOIX D'ALLER EN G    
        else
            if (z<PI(k,7,i)) %%% choix d'aller en N
                Q(1,7) = Q(1,7) + eta2*(R(1,7) - V(k,7,i)) ;
                V(k+1,7,i) = V(k,7,i) + eta*(R(1,7)-V(k,7,i));
                PI(k+1,7,i) = exp(beta*Q(1,7))/( exp(beta*Q(1,7)) + exp(beta*Q(2,7)) );
                
            else %%% choix d'aller en O
                Q(2,7) = Q(2,7) + eta2*(R(2,7)-V(k,7,i)) ;
                V(k+1,7,i) = V(k,7,i) + eta*(R(2,7)-V(k,7,i));
                PI(k+1,7,i) = 1 - (exp(beta*Q(2,7))/( exp(beta*Q(1,7)) + exp(beta*Q(2,7)) ));
            end
            %%% mise à jour de C    
            Q(2,3) = Q(2,3) + eta2*(R(2,3) + gamma*V(k,7,i) - V(k,3,i)) ;
            V(k+1,3,i) = V(k,3,i) + eta*(R(2,3) + gamma*V(k,7,i) - V(k,3,i));
        
            PI(k+1,3,i) = 1 - ( exp(beta*Q(2,3))/( exp(beta*Q(1,3)) + exp(beta*Q(2,3)) ));
            
            PI(k+1,7,i) = PI(k,7,i);  %%% maintenir la politique de F
            V(k+1,7,i)=V(k,7,i);  %%% maintenir la valeur de F
        end
        PI(k+1,2,i) = PI(k,2,i);  %%% maintenir la politique de B
        V(k+1,2,i)=V(k,2,i); %%% maintenir la valeur de B
        PI(k+1,4,i) = PI(k,4,i);  %%% maintenir la politique de D
        V(k+1,4,i)=V(k,4,i); %%% maintenir la valeur de D
        PI(k+1,5,i) = PI(k,5,i);  %%% maintenir la politique de E
        V(k+1,5,i)=V(k,5,i); %%% maintenir la valeur de E
        
        %%%% mise à jour de A 
        Q(2,1) = Q(2,1) + eta2*(R(2,1) + gamma*V(k,3,i) - V(k,1,i)) ;
        V(k+1,1,i) = V(k,1) + eta*(R(2,1) + gamma*V(k,3,i) - V(k,1,i)); 
        PI(k+1,1,i) = 1 - ( exp(beta*Q(2,1))/( exp(beta*Q(1,1)) + exp(beta*Q(2,1))));
        
    end
end

    
            
            
            
            
         


        
        
