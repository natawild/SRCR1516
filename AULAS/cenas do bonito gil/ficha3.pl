% Extensão do predicado maior : Numero,Numero,Numero -> {V,F}

maior(X,Y,X):- (X>Y).
maior(X,Y,Y):- (X=<Y).

% Extensão do predicado nao : Questao -> {V,F}
nao(Questao):- Questao,!,fail.
nao(Questao).




% Extensão do predicado pertence : Numero,[Numero] -> {V,F}
 
 pertence(X,[K|Z]):- X\=K,pertence(X,Z). 
 pertence(X,[X|Z]).

% Extensão do predicado comprimento : [Numero],Numero->{V,F}

comprimento([X|Y],K):- comprimento(Y,J),K is J+1.
comprimento([X],1). 
comprimento([],0).

% Extensão do predicado quantos : [Numero],Numero->{V,F}
quantos([],0).

quantos([X|Y],K):- nao(pertence(X,Y)),quantos(Y,J), K is J+1.

quantos([X|Y],K):- pertence(X,Y),quantos(Y,K).

% Extensão do predicado apagar : Numero,[Numero],[Numero] -> {V,F}
apagar(_,[],[]).
apagar(X,[X|Y],Y).
apagar(X,[Y|K],[Y|M]):- X\==Y, apagar(X,K,M).


% Extensão do predicado eliminaElemento: Elemento,Lista,Resultados -> {V, F}
	
eliminaElemento( _,[],[] ) .
eliminaElemento( E,[E|T],T1 ):- eliminaElemento( E,T,T1 ).
eliminaElemento( E,[H|T],[H|T1] ) :- E\==H,
					eliminaElemento( E,T,T1 ).



% Extensão do predicado inserir: Elemento,Lista,Resultados -> {V, F}
inserir(X,[],[X]).
inserir(X,[Y|K],[Y|H]):-X\==Y, inserir(X,K,H).

% Extensão do predicado concatenar: Lista,Lista,Resultado -> {V, F}
concatenar([],[X|Y],[X|Y]).
concatenar([X|Y],L,[X|O]):-concatenar(Y,L,O).

% Extensão do predicado inverter: Lista,Lista -> {V, F}

inverter(Xs, Ys):- inverter(Xs, [], Ys).
inverter([], Ys, Ys).
inverter([X|Xs], Acc, Ys):- inverter(Xs, [X|Acc], Ys).

% Extensão do predicado subLista: Lista,Lista -> {V, F}

sublist( [], _ ).
sublist( [X|XS], [X|XSS] ) :- sublist( XS, XSS ).
sublist( [X|XS], [K|XSS] ) :- X\==K,sublist( [X|XS], XSS ).


