Ciao Carlo, ho modificato qualcosina del codice e ho fatto in pratica 2 cose:

- la prova con le sinusoidi pure, funziona, ma non essendo affatto sparse non si pu� fare nessun tipo di classificazione con questo metodo, anche perch� basterebbe una fft, cio� un analisi spettrale qualunque per capire cosa e dove sono

- coi segnali audio, uno � diverso da quello che hai tu semplicemente perch� avevo problemi a scaricare quel file audio, comunque ho generalizzato tutti i parametri, dunque dovrebbe in teoria funzionare anche coi tuoi file, ora ci tocca classificare

Problema al quale sto pensando e al quale se hai tempo ti invito a pensare:

- Nell'articolo cita come features utili quelle con la differenza di fase normalizzata alla frequenza e alla distanza tra microfoni; secondo te la distanza tra i microfoni la scegliamo a prescindere dall'aliasing spaziale? Secondo me si, perch� in realt� non stiamo sondando nulla con una sola frequenza, dunque volendo potremmo soddisfare la condizione (d<=lambdamin/2), dove d � la distanza tra microfoni e lambdamin � la lambda corrispondente alla frequenza massima che ci aspettiamo, ma questo significherebbe limitare la visuale solo ad un certo spettro.n Sicuramente la distanza influisce sulla normalizzazione e quindi sulle features, di conseguenza anche sulla classificazione.

Che ne dici?

Fammi sapere..io mi metto al lavoro in questi giorni..