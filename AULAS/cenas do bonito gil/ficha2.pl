% Extensao do predicado soma : Numero,Numero,Numero-> {V,F}

soma(X,Y,K):- K is X+Y.

% Extensao do predicado predicado : Numero,Tipo,Numero,Numero-> {V,F}
predicado(X,+,Y,K):- K is X+Y.
predicado(X,-,Y,K):- K is X-Y.
predicado(X,/,Y,K):- Y\=0,K is X/Y.
predicado(X,*,Y,K):- K is X*Y.

% Extensao do predicado soma3 : Numero, Numero,Numero,Numero ->{V,F}
soma3(X,Y,Z,K):- K is X+Y+Z.

% Extensao do predicado soma4 : [Numero],Numero -> {V,F}


soma4([X|Y],K):- soma4(Y,Z),K is X+Z.
soma4([X],X).

% Extensao do predicado soma5 : [Numero],Tipo,Numero->{V,F}

soma5([X|Y],+,K):- soma5(Y,+,H),K is X+H.
soma5([X],+,X).

soma5([X|Y],-,K):- soma5(Y,-,H),K is X-H.
soma5([X],-,X).

soma5([X|Y],/,K):- X\=0,soma5(Y,\,H),K is H/X.
soma5([X],/,X).

soma5([X|Y],*,K):- soma5(Y,*,H),K is X*H.
soma5([X],*,X).


% Extensao do predicado maior :Numero,Numero,Numero->{V,F}

maior(X,Y,X):- X>Y.
maior(X,Y,Y):- X=<Y.

% Extensao do predicado maior1 :[Numero],Numero->{V,F}

maior1([X|Y],K):- maior1(Y,D),maior(X,D,K).
maior1([X],X).

% Extensao do predicado menor : Numero,Numero->{V,F}

menor(X,Y,X):- Y>X.
menor(X,Y,Y):- X>=Y.

% Extensao do predicado menor1 :[Numero],Numero->{V,F}

menor1([X|Y],K):-menor1(Y,D),menor1(X,D,K).
menor1([X],X).

% Extensao do predicado contador :[Numero],Numero->{V,F}

contador([X|Y],K) :- contador(Y,D), K is D+1.

contador([X],1).

% Extensao do predicado media : [Numero],Numero->{V,F}

media([X|Y],K):- media(Y,D), contador([X|Y],J),K is X+D/J.

media([X],X).


% Extensao do predicado insert_sort : [Numero],[Numero]->{V,F}

insert_sort(List,Sorted):-i_sort(List,[],Sorted).


i_sort([H|T],Acc,Sorted):-insert(H,Acc,NAcc),i_sort(T,NAcc,Sorted).
i_sort([],Acc,Acc).

% Extensao do predicado insert : Numero,[Numero],[Numero]->{V,F}

insert(X,[Y|T],[Y|NT]):- X>Y,insert(X,T,NT).
insert(X,[Y|T],[X,Y|T]):- X=<Y.
insert(X,[],[X]).


% Extensao do predicado vazio : [[Numero]],Numero->{V,F}




% Extensao do predicado nao : Questao ->{V,F}

nao(Questao):- Questao, !,fail.
nao(Questao).
