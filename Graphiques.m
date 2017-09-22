function Graphiques(N,PI,V,i)
figure(1)
 clf;
k = [1:N] ;

 plot(k,PI(k,1,i),'b');
 hold on;
 plot(k,PI(k,2,i),'g');
 plot(k,PI(k,3,i),'r');
legend('pi(L,A)','pi(L,B)','pi(L,C)','Location','southwest');
xlabel('trials');
ylabel('pi estimates');
 
 %%% value function 
figure(2);
clf;
plot(k,V(k,1,i), 'b');
hold on; 
plot(k,V(k,2,i), 'g');
hold on;
plot(k,V(k,3,i), 'r');
legend('V(A)','V(B)','V(C)','Location', 'southeast');
xlabel('trials');
ylabel('V estimates');
