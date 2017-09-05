function [theta]=features(Y1,Y2,fs,fk)

%Assumo che tutti i segnali contengano parlato, dunque max freq facciamo
%esagerando il Nyquist, ovvero circa 11Khz, poich� campioniamo a 22050Hz.
%Allora c/f=lambda, cio� 340/11000=lambda in metri, e dmax per poter
%ascoltare tutte le sorgenti da -pi/2 a +pi/2 senza aliasing angolare e
%dunque di frequenza spaziale, dmax=lambda/2

f=fs/2;
c=340; %velocit�
dmax=(c/2*f); %� gi� in metri
alfa=(4*pi*dmax)/c;  %dmax va espressa in metri, ed � la distanza massima anti-aliasing angolare per i sensori
A=sqrt(sum(sum((abs(Y1(:)).^2+abs(Y2(:)).^2))));

w1=length(Y1(1,:));
l1=length(Y1(:,1));
w2=length(Y2(1,:));
l2=length(Y2(:,1));

Y1amp=reshape(abs(Y1)/A,w1*l1,1);
Y2amp=reshape(abs(Y2)/A,w2*l2,1);
FAS=angle(Y2).-angle(Y1);

for v=1:length(FAS(:,1))
    FAS(v,:)=FAS(v,:)*1/(2*pi*fk(v)/5);    %ok, con questo peso la feature di fase ha la stessa varianza di quelle di modulo
end

h=length(FAS(:,1));
k=length(FAS(1,:));

FASr=reshape(FAS,h*k,1);

theta=[Y1amp Y2amp FASr];

%ora la feature 1 contiene tutte le ampiezze normalizzate dei bin in
%frequenza di ogni finestra del segnale osservato al mic1, e concatenato a
%questa serie di dati che � stata caricata come vettore colonna, c'� lo
%stesso tipo di sequenza ma associata alla stft dei dati osservati al mic2


