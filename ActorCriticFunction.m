%%%%% parcours simple avec politique évolutive %%%%%
function [V,PI] = ActorCriticFunction(eta,eta2,gamma,beta,N,i,PI,V,R)


 %%% politique pour la gauche 




Q = zeros(2,7); %%% valeur des actions



for k = 1:N-1
    x = rand; 
    y = rand;
    z=rand;
  
    if (x < PI(k,1,i)) 
    %% ************** Choix d'aller en G ***************
        
        
        if (y < PI(k,2,i)) 
            %%%%%% CHOIX D'ALLER EN GG
            
            if (z<PI(k,4,i)) 
            %%% choix d'aller en GGG
                [ V,PI ] = MiseAJourG(R,Q,V,PI,4,0,i,k,eta,eta2,gamma,beta);
                
            else 
            %%% choix d'aller en GGD
                [ V,PI ] = MiseAJourD(R,Q,V,PI,4,0,i,k,eta,eta2,gamma,beta);
            end
            %%% mise à jour de G    
            [ V,PI ] = MiseAJourG(R,Q,V,PI,2,4,i,k,eta,eta2,gamma,beta);
            
            [ V,PI ] = MaintenirValeurs( V,PI,i,5,k ); %%% maintenir la valeur de GD
            
            
            
        
        else 
        %%%%%% CHOIX D'ALLER EN GD 
            if (z<PI(k,5,i))   
             %%% choix d'aller en GDG
                [ V,PI ] = MiseAJourG(R,Q,V,PI,5,0,i,k,eta,eta2,gamma,beta);
                
            else 
            %%% choix d'aller en GDD
                [ V,PI ] = MiseAJourD(R,Q,V,PI,5,0,i,k,eta,eta2,gamma,beta);
            end
            %%% mise à jour de G   
            [ V,PI ] = MiseAJourD(R,Q,V,PI,2,5,i,k,eta,eta2,gamma,beta);
            
            [ V,PI ] = MaintenirValeurs( V,PI,i,4,k );   %  maintenir la valeur de GG
        end
        [ V,PI ] = MaintenirValeurs( V,PI,i,3,k );        % maintenir la valeur de D
        [ V,PI ] = MaintenirValeurs( V,PI,i,6,k );       % maintenir la valeur de DG
        [ V,PI ] = MaintenirValeurs( V,PI,i,7,k );       % maintenir la politique de DD
        
        %%%% mise à jour de O 
        [ V,PI ] = MiseAJourG(R,Q,V,PI,1,2,i,k,eta,eta2,gamma,beta);
    
    
        
        
        
    else   
    %% *********** Choix d'aller en D *****************
        
        
        if (y < PI(k,3,i)) 
         %%%%%% CHOIX D'ALLER EN DG 
            
            if (z<PI(k,6,i)) 
            %%% choix d'aller en DGG
                [ V,PI ] = MiseAJourG(R,Q,V,PI,6,0,i,k,eta,eta2,gamma,beta);
                
            else 
            %%% choix d'aller en DGD
                [ V,PI ] = MiseAJourD(R,Q,V,PI,6,0,i,k,eta,eta2,gamma,beta);
            end
            %%% mise à jour de D     
            [ V,PI ] = MiseAJourG(R,Q,V,PI,3,6,i,k,eta,eta2,gamma,beta);
            [ V,PI ] = MaintenirValeurs( V,PI,i,7,k );   %%% maintenir la valeur de DD
   
            
            
            
            
        else
        %%%%% CHOIX D'ALLER EN DD
            if (z<PI(k,7,i)) 
            %%% choix d'aller en DDG
                [ V,PI ] = MiseAJourG(R,Q,V,PI,7,0,i,k,eta,eta2,gamma,beta);
                
            else 
            %%% choix d'aller en DDD
                [ V,PI ] = MiseAJourD(R,Q,V,PI,7,0,i,k,eta,eta2,gamma,beta);
            end
            %%% mise à jour de D  
                [ V,PI ] = MiseAJourD(R,Q,V,PI,3,7,i,k,eta,eta2,gamma,beta);
                [ V,PI ] = MaintenirValeurs( V,PI,i,6,k );  %%% maintenir la valeur de DG
        end
        [ V,PI ] = MaintenirValeurs( V,PI,i,2,k );           %%% maintenir la valeur de G
        [ V,PI ] = MaintenirValeurs( V,PI,i,4,k );           %%% maintenir la valeur de GG
        [ V,PI ] = MaintenirValeurs( V,PI,i,5,k );           %%% maintenir la valeur de GD
        
        %%%% mise à jour de O
        [ V,PI ] = MiseAJourD(R,Q,V,PI,1,3,i,k,eta,eta2,gamma,beta);
        
    end
end

    

end

            
            
            
            
         


        
        
