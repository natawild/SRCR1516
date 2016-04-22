% Extensao do  pre:[Numero],Tipo,Numero-> {V,F}			   



pre([X|Y],+,K):- pre(Y,+,Ry), 
                         K is Ry+X.
pre([X],+,X).                        

pre([X|Y],-,K):- pre(Y,-,Ry), 
                         K is Ry-X.
pre([X],-,X).                       

pre([X|Y],/,K):- X\=0, pre(Y,/,Ry), 
                         K is Ry/X.

pre([X],/,X).                       

pre([X|Y],*,K):- pre(Y,*,Ry), 
                         K is Ry*X.  

pre([X],*,X).


% Extensao do  maior:Numero,Numero-> {V,F}		
maior(X,Y,X):- X>Y.
maior(X,Y,Y):- X=<Y.

% Extensao do  maiores:[Numero],Numero-> {V,F}

maiores([X],X).
maiores([X|Y],L) :- maiores(Y,Ry),maior(X,RY,L).

