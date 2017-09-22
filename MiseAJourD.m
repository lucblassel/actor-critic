function [ V,PI ] = MiseAJourD(R, Q,V,PI,point,Npoint,i,k,eta,eta2,gamma,beta)
if Npoint ~= 0
    Q(2,point) = Q(2,point) + eta2*(R(2,point) + gamma*V(k,Npoint,i) - V(k,point,i)) ;         % mise à jour à la ligne 2 car à droite 
    V(k+1,point,i) = V(k,point,i) + eta*(R(2,point) + gamma*V(k,Npoint,i) - V(k,point,i));
    
else
    Q(2,point) = Q(2,point) + eta2*(R(2,point) - V(k,point,i)) ;
    V(k+1,point,i) = V(k,point,i) + eta*(R(2,point) - V(k,point,i));
    
end
PI(k+1,point,i) = 1 - (exp(beta*Q(2,point))/( exp(beta*Q(1,point)) + exp(beta*Q(2,point)) ));
 % on met à jour les probas de gauche, l'opposé des probas de droites mises
 % à jour par rapport à 1 
 