function [PISuperMoy,VSuperMoy] = SuperMoyennes (PImoy,Vmoy,N,seuil)

[nblig,nbcol] = size(Vmoy);                               % on récupère la taille de Vmoy (3 ou 7 selon le modèle)

VSuperMoy = zeros(1,nbcol);                               % on attribue le nombre de colonnes à la taille du vecteur moyen. 
PISuperMoy = zeros(1,nbcol);


for j=1:nbcol                                             % on calcule pour chaque composante
    for k = seuil:N                                       % à partir de la valeur seuil où on veut calculer les moyennes 
        VSuperMoy(j) = VSuperMoy(j) + Vmoy(k,j);          % on ajoute la valeur au rang k pour la composante i
        PISuperMoy(j) = PISuperMoy(j) + PImoy(k,j);
    end
    VSuperMoy(j) = VSuperMoy(j)/(N-seuil+1);              % on divise par le nombre d'itérations
    PISuperMoy(j) = PISuperMoy(j)/(N-seuil+1);
end


        

        
     