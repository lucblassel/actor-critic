%%%% programme principal %%%%%%

% R = [1,1,1 ; 2,4,1];
R= randi(10,2,3);

N = 1000;
dimension = 50;
eta = 0.1; 
eta2 = 0.1;
gamma = 1;
beta = 0.1;

V = zeros(N,3,dimension);
PI = ones(N,3,dimension);

for i=1:dimension
    PI(1,:,i) = [0.5,0.5,0.5];
end


for i=1:dimension
    [V,PI] = ActorCritic2(eta,eta2,gamma,beta,N,i,PI,V,R);
end

[PImoy,Vmoy] = Moyennes2(PI,V,N,dimension);

GraphiquesMoyennes2(N,PImoy,Vmoy,R);
    







    