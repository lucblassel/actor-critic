function [V,PI ] = MiseAJourG(R, Q,V,PI,point,Npoint,i,k,eta,eta2,gamma,beta)

if Npoint ~= 0  % Si on est au bout de l'arbre 
    Q(1,point) = Q(1,point) + eta2*(R(1,point) + gamma*V(k,Npoint,i) - V(k,point,i)) ;  % mise � jour de Q � la ligne 1 car � gauche. 
    V(k+1,point,i) = V(k,point,i) + eta*(R(1,point) + gamma*V(k,Npoint,i) - V(k,point,i)); % mise � jour de V � l'essai k+1
    
else            % Si on est aux premiers noeuds 
    Q(1,point) = Q(1,point) + eta2*(R(1,point) - V(k,point,i)) ;                       % mise � jour sans prendre en compte l'�tat suivant (�gal � 0)      
    V(k+1,point,i) = V(k,point,i) + eta*(R(1,point) - V(k,point,i));                   % idem pour V 
    
end 

PI(k+1,point,i) = exp(beta*Q(1,point))/( exp(beta*Q(1,point)) + exp(beta*Q(2,point)) ); % calcul de PI � partir de Q 