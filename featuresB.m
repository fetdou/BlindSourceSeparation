function [Theta]=featuresB(Y1,Y2,fs,fk)

%Assumo che tutti i segnali contengano parlato, dunque max freq facciamo
%esagerando il Nyquist, ovvero circa 22Khz, poich� campioniamo a 44100Hz.
%Allora c/f=lambda, cio� 340/22000=lambda in metri, e dmax per poter
%ascoltare tutte le sorgenti da -pi/2 a +pi/2 senza aliasing angolare e
%dunque di frequenza spaziale, dmax=lambda/2

f=fs/2;
c=340;
lambda=c/f;
dmax=lambda/2;
alfa=(4*pi*dmax)/c;


quoz=Y2./Y1;
amp=abs(quoz);
fas=angle(quoz);
dim1=size(Y1,1);
dim2=size(Y1,2);
%*(1/(alfa*i))

for i=1:(dim1/2)+1
    fas(i,:)=fas(i,:)*(1/(alfa*i));
end

for i=dim1:-1:(dim1/2)+2
    fas(i,:)=fas(i-((dim1/2)+1),:);
end

ampl=reshape(amp,dim1*dim2,1);
fasl=reshape(fas,dim1*dim2,1);


Theta=[ampl fasl];