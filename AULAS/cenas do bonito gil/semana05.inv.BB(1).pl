%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: definicoes iniciais

:- op( 900,xfy,'::' ).
:- dynamic filho/2.
:- dynamic pai/2.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado filho: Filho,Pai -> {V,F,D}

filho( joao,jose ).
filho( jose,manuel ).
filho( carlos,jose ).

% Invariante Estrutural:  nao permitir a insercao de conhecimento
%                         repetido

+filho( F,P ) :: (solucoes( (F,P),(filho( F,P )),S ),
                  comprimento( S,N ), 
				  N == 1
                  ).

% Invariante Referencial: nao admitir mais do que 2 progenitores
%                         para um mesmo individuo

+filho( F,P ) :: (solucoes( P,(filho( F,P )),S ),
                  comprimento( S,N ), 
				  N =< 2 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extens�o do predicado que permite a evolucao do conhecimento

evolucao( Termo ) :- solucoes(I,+T::I,Li),insiro(T),verifico(Li).

% Extens�o do predicado verifico : L->{V,F}
verifico ([]).
verifico([I|L]):- I,verifico(L).

 
% Extens�o do predicado insiro :L->{V,F}
insiro(L):- assert(T).
insiro(L):- retract(T),!,fail.



% Extensao do predicado solucoes :: X,Teorema,Solucoes->{V,F}
 
   solucoes(X,TEOREMA,S) :-




