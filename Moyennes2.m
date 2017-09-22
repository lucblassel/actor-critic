function [PImoy,Vmoy] = Moyennes2(PI,V,N,dimension)

PImoy=zeros(N,3);
Vmoy=zeros(N,3);

for l=1:N
    for c=1:3
        for i=1:dimension
            Vmoy(l,c)=Vmoy(l,c)+V(l,c,i);
            PImoy(l,c)=PImoy(l,c)+PI(l,c,i);
        end
        Vmoy(l,c) = Vmoy(l,c)/dimension;
        PImoy(l,c) = PImoy(l,c)/dimension;
    end
end