function DessinerArbre(R)
close;
W=[];
for j=1:3
    for i=1:2
        W = [W,R(i,j)];
    end
end

DG = sparse([1 1 2 2 5 5],[2 5 3 4 6 7],W,7,7)
ids = {'A','B','D','E','C','F','G'};
 h = view(biograph(DG,ids,'ShowWeights','on'))