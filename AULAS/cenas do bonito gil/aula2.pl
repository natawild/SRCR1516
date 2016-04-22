

% Extensao do predicado soma: Numero,Numero,Numero -> {V,F}

:- dynamic numero/2.

soma(X,Y,K) :-
       
	      K is X+Y.

		

		
		
	

% Extensao do predicado soma:[Numero],Numero-> {V,F}			   
				   
  

soma([X|Y],K) :- soma(Y,Ry),
              K is X+Ry. 
soma([X],X).				   

% Extensao do predicado predicado:[Numero],Tipo,Numero-> {V,F}			   

predicado ([X],+,X).
predicado ([X],-,X).
predicado ([X],/,X).
predicado ([X],*,X).





				   

% Extensao do predicado operacao: Numero,Numero,Tipo,Numero -> {V,F}


operacao(X,Y,+,P):- 
             P is X+Y.

operacao(X,Y,-,P):- 
                  P is X-Y.

				  operacao(X,Y,/,P):- P is X /Y.

				  operacao(X,Y,*,P):- y /=0
                    P is X*Y.




				   
