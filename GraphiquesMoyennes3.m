function GraphiquesMoyennes3(N,PImoy,Vmoy,PISuperMoy,VSuperMoy,R)

%% ******** Affichage des probas d'aller à gauche aux états O, G et D ********
figure(1)                  
 clf;
k = [1:N] ;
subplot(1,2,1)
 plot(k,PImoy(k,1),'b');
 hold on;
 plot(k,PImoy(k,2),'g');
 hold on;
 plot(k,PImoy(k,3),'r');
legend('P(aller à gauche | O)','P(aller à gauche | G)','P(aller à gauche | D)','Location','southwest');
xlabel('trials');
ylabel('pi estimates');
 


%% ******* Affichage des valeurs des états O, G et D *************
subplot(1,2,2)
C1 = plot(k,Vmoy(k,1), 'b');              % Valeur de l'état O
hold on;
C1m = plot(k, VSuperMoy(1)*ones(N),'b');  % valeur moyenne de l'état O
hold on; 
C2 = plot(k,Vmoy(k,2), 'g');              % valeur de l'état G 
hold on;
C2m = plot(k, VSuperMoy(2)*ones(N),'g');  % valeur moyenne de l'état G 
hold on;
C3 = plot(k,Vmoy(k,3), 'r');              % valeur de l'état D 
hold on;
C3m = plot(k, VSuperMoy(3)*ones(N),'r');  % valeur moyenne de l'état D 

legend([C1 C2 C3],{'V(O)','V(G)','V(D)'},'Location', 'southeast');
xlabel('trials');
ylabel('V estimates');






%% ********** dessiner arbre avec récompenses et états *************

% Initialisation 
child_handles = allchild(0);
names = get(child_handles,'Name');
k = find(strncmp('Biograph Viewer', names, 15));
close(child_handles(k))

% on aplatit le vecteur récompense pour faire un vecteur de poids
[nblig,nbcol] = size(R);
W=[];
for j=1:nbcol
    for i=1:nblig
        W = [W,R(i,j)];  
    end
end

% Jointures entre les points et association avec le vecteur poids 
DG = sparse([1 1 2 2 3 3 4 4 5 5 6 6 7 7],[2 3 4 5 6 7 8 9 10 11 12 13 14 15],W,15,15); 
ids = {'O','G','D','GG','GD','DG','DD','GGG','GGD','GDG','GDD','DGG','DGD','DDG','DDD'};  % légende
h=biograph(DG,ids,'ShowWeights','on'); 
 

%% ********** dessiner arbre valeurs-probabilités *****************

% Initialisation 
child_handles = allchild(0);
names = get(child_handles,'Name');
k = find(strncmp('Biograph Viewer', names, 15));
close(child_handles(k))
WPI = [];

% création du vecteur de probabilités
for j=1:7
    WPI=[WPI,PISuperMoy(j)];
    WPI = [WPI,1-PISuperMoy(j)];  
end

% affichage des valeurs à chaque noeud 
DV = sparse([1 1 2 2 3 3 4 4 5 5 6 6 7 7],[2 3 4 5 6 7 8 9 10 11 12 13 14 15],WPI,15,15);
ids2 = {strcat('V(O) = ',num2str(VSuperMoy(1))),strcat('V(G) = ',num2str(VSuperMoy(2))),strcat('V(D) = ',num2str(VSuperMoy(3))),strcat('V(GG) = ',num2str(VSuperMoy(4))), strcat('V(GD) = ',num2str(VSuperMoy(5))), strcat('V(DG) = ',num2str(VSuperMoy(6))), strcat('V(DD) = ',num2str(VSuperMoy(7))),'V(GGG) = 0','V(GGD) = 0','V(GDG) = 0','V(GDD) = 0','V(DGG) = 0','V(DGD) = 0','V(DDG) = 0','V(DDD) = 0' } ; 
h2=biograph(DV,ids2,'ShowWeights','on');

%% ********** Affichage des biograph **************
view(h);
view(h2);
 
 
