function GraphiquesMoyennes2(N,PImoy,Vmoy,R)
figure(1)
 clf;
k = [1:N] ;
subplot(1,2,1)
 plot(k,PImoy(k,1),'b');
 hold on;
 plot(k,PImoy(k,2),'g');
 plot(k,PImoy(k,3),'r');
legend('P(aller à gauche | O)','P(aller à gauche | G)','P(aller à gauche | D)','Location','southwest');
xlabel('trials');
ylabel('pi estimates');
 
 %%% value function 
subplot(1,2,2)
plot(k,Vmoy(k,1), 'b');
hold on; 
plot(k,Vmoy(k,2), 'g');
hold on;
plot(k,Vmoy(k,3), 'r');
legend('V(O)','V(G)','V(D)','Location', 'southeast');
xlabel('trials');
ylabel('V estimates');

%%%% dessiner arbre avec récompenses et états 

W=[];
for j=1:3
    for i=1:2
        W = [W,R(i,j)];
    end
end

child_handles = allchild(0);
names = get(child_handles,'Name');
k = find(strncmp('Biograph Viewer', names, 15));
close(child_handles(k))

DG = sparse([1 1 2 2 3 3],[2 3 4 5 6 7],W,7,7);
ids = {'O','G','D','GG','GD','DG','DD'};

 h = view(biograph(DG,ids,'ShowWeights','on'))
 
