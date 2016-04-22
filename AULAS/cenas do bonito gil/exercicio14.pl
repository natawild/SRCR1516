%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - LEI/2015

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Exercicio 1

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Base de Conhecimento com informacao relatica a uma árvore genealogica.

%--------------------------------- - - - - - - - - - - - - - - -
% SICStus PROLOG: Declaracoes iniciais

:- op( 900,xfy,'::' ).
:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: definicoes iniciais

:- dynamic filho/2.
:- dynamic natural/2.

% Invariante Estrutural:  nao permitir a insercao de conhecimento repetido

+filho(F,P) :: (solucoes( (F,P), filho( F,P ), S),
				comprimento( S,N ), N == 1
				).

+natural(N,T) :: (solucoes( (N,T), natural( N,T ), S),
				comprimento( S,X ), X == 1
				).


% Invariante Referencial:

+filho( F,_ ) :: (solucoes( P, filho(F, P), S ),
				 comprimento( S,N ), N =< 2
				 ).

+natural( N,_ ) :: (solucoes( T, natural(N,T), S),
				 comprimento( S,X ), X == 1
				 ).

+filho( F,P ) :: nao(descendente(P,F,_)).

% conhecimento/factos

filho(carlos,jose).
filho(rui,jose).
filho(joao,jose).

filho(carlos,maria).
filho(rui,maria).
filho(joao,maria).

filho(jorge,carlos).
filho(leonor,carlos).

filho(jorge,ana).
filho(leonor,ana).

filho(diogo,rui).
filho(diogo,joana).

filho(vitor,diogo).

filho(tiago,joao).
filho(tiago,rita).

filho(hugo,leonor).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado filhos: Pai, Resultado -> {V,F}

filhos( P,R ) :- solucoes(F, filho( F,P ), S),
		eliminarRepetidos(S,S1),
		R = S1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pai: Pai,Filho -> {V,F}

pai( P,F ) :- filho( F,P ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pais: Filho,Resultado -> {V,F}

pais( F,R ) :- solucoes(P, filho( F,P ), S),
		eliminarRepetidos(S,S1),
		R = S1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado tio: Tio,Sobrinho -> {V,F}

tio( T,S ) :- irmao( I,T ),
	      pai( I,S ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado tios: Sobrinho,Resultado -> {V,F}

tios( S1,R ) :- solucoes(T, tio( T,S1 ), S),
		eliminarRepetidos(S,S2),
		R = S2.
			
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado sobrinho: Sobrinho,Tio -> {V,F}

sobrinho( S,T ) :- tio( T,S ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado sobrinhos: Tio,Resultado -> {V,F}

sobrinhos( T,R ) :- solucoes(S , sobrinho( S,T ), S),
		    eliminarRepetidos(S,S1),
			R = S1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado primo: Primo,Primo -> {V,F}

primo( P1,P2 ) :- pai( T1,P1 ),
		  pai( T2,P2 ),
		  irmao( T1,T2 ),
		  T1 \== T2.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado primos: Primo,Resultado -> {V,F}

primos( P1,R ) :- solucoes(P , primo( P1,P ), S),
			eliminarRepetidos(S,S1),
			R=S1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado irmao: Irmao,Irmao -> {V,F}

irmao( I1,I2 ) :- pai( P1,I1),
		  pai( P1,I2),
		 I1\==I2.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado irmaos: Irmao,Resultado -> {V,F}

irmaos( I1,R ) :- solucoes(I , irmao( I1,I ), S),
		eliminarRepetidos(S,S1),
		R=S1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado neto: Neto,Avo -> {V,F}
neto( N,A ) :- filho( N,P ),
	       filho( P,A ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado netos: Avo,Resultado -> {V,F}

netos( A,R ) :- solucoes(N , avo( A,N ), S),
		eliminarRepetidos(S,S1),
		R = S1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado avo: Avo,Neto -> {V,F}

avo( A,N ) :- pai( P,N ),
	      pai( A,P ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado avo: Neto,Resultado -> {V,F}

avos( N,R ) :- solucoes(A, neto( N,A ), S),
		eliminarRepetidos(S,S1),
		R = S1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisavo: Bisavo,Bisneto -> {V,F}

bisavo( B,N ) :- pai( B,A ),
		 avo( A,N ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisavo: Bisneto,Resultado -> {V,F}

bisavos( N,R ) :- solucoes(B, bisneto( N,B ), S),
		eliminarRepetidos(S,S1),
		R = S1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisneto: Bisneto,Bisavo -> {V,F}

bisneto( N,B ) :- bisavo( B,N ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisneto: Bisavo,Resultado -> {V,F}

bisnetos( B,R ) :- solucoes(N , bisavo( B,N ), S),
		   eliminarRepetidos(S,S1),
			R = S1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -				
% Extensao do predicado casal: Pai,Pai -> {V,F}

casal( P1,P2 ) :- filho(X,P1),
		  filho(X,P2),
		  P1 \== P2.
					
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente -> {V,F}

descendente(D,A) :- 
	filho(D,A);
	filho(D,N),
	descendente(N,A).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendentes: Ascendente, Resultado -> {V,F}

descendentes( A,R ) :- solucoes( D, descendente(D,A), S),
			eliminarRepetidos(S,S1),
			R = S1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente,Grau -> {V,F}

descendente( D,A,1 ) :- filho( D,A ).

descendente( D,A,G ) :- filho( D,X ),
			descendente( X,A,N ), 
			G is N+1.				

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendentes: Ascendente, Grau, Resultado -> {V,F}

descendentes( A,G,R ) :- solucoes( D, descendente( D,A,G ), S),
			eliminarRepetidos(S,S1),
			R = S1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendenteAteGrau: Descendente,Ascendente,Grau -> {V,F}

descendenteAteGrau( D,A,G ) :- descendente( D,A,Z ),
				Z =< G.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendenteAteGrau: Ascendente,Grau,Resultado -> {V,F}

descendentesAteGrau( A,G,R ) :- solucoes(D, descendenteAteGrau( D,A,G ), S),
				eliminarRepetidos(S,S1),
				R = S1.
						   
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado ascendente: Ascendente,Descendente -> {V,F}

ascendente(A,D) :- descendente(D,A).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado ascendentes: Descendente,Resultado -> {V,F}

ascendentes( D,R ) :- solucoes(A , ascendente( A,D ), S),
			eliminarRepetidos(S,S1),
			R = S1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado ascendente: Ascendente,Descendente,Grau -> {V,F}

ascendente( A,D,G ) :- descendente( D,A,G ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado ascendentes: Descendente,Grau,Resultado -> {V,F}

ascendentes( D,G,R ) :- solucoes(A , ascendente( A,D,G ), S),
			eliminarRepetidos(S,S1),
			R = S1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado ascendenteAteGrau: Ascendente,Descendente,Grau -> {V,F}

ascendenteAteGrau( A,D,G ) :- descendente( D,A,Z ),
			Z =< G.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado ascendentesAteGrau: Descendente,Grau,Resultado -> {V,F}

ascendentesAteGrau( D,G,R ) :- solucoes(A, ascendenteAteGrau(A,D,G), S),
				eliminarRepetidos(S,S1),
				R = S1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado nao: Questao -> {V,F}

nao(Questao) :-
	Questao, !, fail .
nao(_) .

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado comprimento: L, R -> {V, F}

comprimento([], 0) .
comprimento([_|T], R) :-
	comprimento(T, X),
	R is 1+X .

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado solucoes: X,Teorema,Solucoes -> {V, F}

solucoes(X, Teorema, _) :- Teorema, 
				  assert(temp(X)), 
				  fail. 
solucoes(_, _, Solucoes) :- assert(temp(fim)), 
				  construir(Solucoes).

construir(Solucoes) :- retract(temp(X)), !,
			(X==fim, !, Solucoes=[];
			Solucoes=[X | Resto], 
			construir(Resto)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado que permite a inserção de conhecimento: Termo -> {v, F}

inserirConhecimento(Termo) :-
	solucoes( Invariante, +Termo::Invariante, Lista),
	insercao(Termo),
	teste( Lista ).

insercao(Termo) :-
	assert(Termo) .
insercao(Termo)	:-
	retract(Termo), !, fail .

teste([]) .
teste([H|T]) :-
	H, teste(T) .	

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado que permite a remoção de conhecimento: Termo -> {v, F}

removerConhecimento(Termo) :- remocao(Termo) .

remocao(Termo) :- retract(Termo).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado relação: Pessoa,Pessoa,Relacao -> {V, F}

relacao(P1,P2,filho) :- filho(P1,P2).
relacao(P1,P2,pai) :- pai(P1,P2).
relacao(P1,P2,irmao) :- irmao(P1,P2).
relacao(P1,P2,primo) :- primo(P1,P2).
relacao(P1,P2,tio) :- tio(P1,P2).
relacao(P1,P2,sobrinho) :- sobrinho(P1,P2).
relacao(P1,P2,avo) :- avo(P1,P2).
relacao(P1,P2,bisavo) :- bisavo(P1,P2).
relacao(P1,P2,neto) :- neto(P1,P2).
relacao(P1,P2,bisneto) :- bisneto(P1,P2).
relacao(P1,P2,casal) :- casal(P1,P2).
relacao(P1,P2,X) :- descendente(P1,P2),
			X = descendente.
relacao(P1,P2,X) :- ascendente(P1,P2),
			X = ascendente.
relacao(_,_,X) :- X = desconhecido.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado eliminarRepetidos: Lista,Resultados -> {V, F}

eliminarRepetidos( [],[] ) .
eliminarRepetidos( [H|T],[H|R] ) :- eliminaElemento( H,T,T2 ),
					eliminarRepetidos( T2,R ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado eliminaElemento: Elemento,Lista,Resultados -> {V, F}
	
eliminaElemento( _,[],[] ) .
eliminaElemento( E,[E|T],T1 ) :- eliminaElemento( E,T,T1 ).
eliminaElemento( E,[H|T],[H|T1] ) :- E\==H,
					eliminaElemento( E,T,T1 ).


















