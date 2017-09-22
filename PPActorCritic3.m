%%%%%%%%%%%%%%%%%%%%%        PROGRAMME PRINCIPAL        %%%%%%%%%%%%%%%%%% 

% R = [1,1,1 ; 2,4,1];
R= ones(2,7);        % matrice pour les 14 branches
R(2,6) = 100;
R(1,1) = 50;
N = 1000;            % nombre d'itérations
dimension = 100;     % nombre d'expériences
eta = 0.2;           % taux d'apprentissage pour V
eta2 = 0.3;          % taux d'apprentissage pour q
gamma = 1;           % importance de la projection dans le futur
beta = 1;          % balance exploration/exploitation  

V = zeros(N,7,dimension);                                            % matrice en 3D conservant la valeur des états pour chaque itération de chaque expérience
PI = ones(N,7,dimension);                                           % matrice en 3D conservant la valeur des probas d'aller à gauche pour chaque itération de chaque expérience

for i=1:dimension
    PI(1,:,i) = [0.5,0.5,0.5,0.5,0.5,0.5,0.5];                      % initialisation des probas uniformément 
end


for i=1:dimension  
    [V,PI] = ActorCriticFunction(eta,eta2,gamma,beta,N,i,PI,V,R);  % algorithme de mises à jour des valeurs d'états et probas  
end

[PImoy,Vmoy] = Moyennes3(PI,V,N,dimension);                         % Moyenne sur les dimensions expériences          

[PISuperMoy,VSuperMoy] = SuperMoyennes(PImoy,Vmoy,N,200) ;         % Moyenne sur les itérations à partir d'un certain seuil
  
GraphiquesMoyennes3(N,PImoy,Vmoy,PISuperMoy,VSuperMoy,R);           % Affichage des graphiques (voir fonction)
    













    