%Inverse STFT

% FORMULA PER IL CALCOLO DELLA LUNGHEZZA DEL SEGNALE A PARTIRE DALLA STFT
% 
% length(signal)=(length(win)/2)*#splice-length(win)/2+length(win);
% 

function [signal]=ISTFT(trasf,win,av)


dim2=size(trasf,2); %numero di colonne della matrice, cio� numero di finestre temporali
M=length(win);
R=M*av;

for i=1:dim2;  
    sigIFFT(:,i)=ifft(trasf(:,i),'symmetric'); %al massimo reinserire 'symmetric'
end;

lunghezza= M+((dim2-1)*R);
signal=zeros(lunghezza,1);

%preparo il primo splice del seganle ricostruito
signal(1:M,1)=(sigIFFT(:,1));
start=1;

for n=2:dim2;
    
    start=start+R; %diviso 2 al posto che diviso 4
    fin=start+M-1;
    
    signal(start:fin,1)=(sigIFFT(:,n))+signal(start:fin,1);
         
end;
