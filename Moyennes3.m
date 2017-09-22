function [PImoy,Vmoy] = Moyennes3(PI,V,N,dimension)

PImoy=zeros(N,7);
Vmoy=zeros(N,7);

for l=1:N
    for c=1:7
        for i=1:dimension
            Vmoy(l,c)=Vmoy(l,c)+V(l,c,i);
            PImoy(l,c)=PImoy(l,c)+PI(l,c,i);
        end
        Vmoy(l,c) = Vmoy(l,c)/dimension;
        PImoy(l,c) = PImoy(l,c)/dimension;
    end
end