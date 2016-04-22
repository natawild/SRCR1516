%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Programacao em logica estendida
%
% Representacao de conhecimento imperfeito

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: definicoes iniciais

:- op( 900,xfy,'::' ).
:- dynamic jogo/3.
:- dynamic pai/2.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado jogo: Id,Arb,Custo -> {V,F,D}

jogo(1,almeida_Antunes,500).
jogo(3,jose,100).
jogo(4,gil,600).

-jogo( ID,Arb,C ) :-
    nao( jogo(ID,Arb,C) ),
    nao( excecao( jogo(ID,Arb,C))).

% Invariante Estrutural:  nao permitir a insercao de conhecimento
%                         repetido

+jogo( ID,Arb,C ) :: (solucoes( (ID,Arb,C),(jogo( ID,Arb,C )),S ),
                  comprimento( S,N ), N == 1
                  ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% excecao do arbito baltazar_Borges 

jogo(2,baltazar_Borges,xpto1234).

excecao(jogo(ID,Arb,C)):-jogo(ID,Arb,xpto1234). 


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% excecao do arbito  Costa Carvalho

excecao(jogo(3,costa_Carvalho,500)).

excecao(jogo(3,costa_Carvalho,2000)).
 

 % excecao do  Duarte Durão 

 excecao(jogo(4,duarte_Durao,C)):- C>250,C<750.


  % excecao do Edgar Esteves

jogo(5,edgar_Esteves,xpto12345).

excecao(jogo(ID,Arb,C)):- jogo(ID,Arb,xpto12345).

nulo(xpto12345).

+jogo(ID,Arb,C) :: (solucoes( (ID,Arb,Cs),(jogo(ID,edgar_Esteves,Cs),nao(nulo(Cs))),S ),
                  comprimento( S,N ), N == 0 
                  ).





%--------------------------------- - - - - - - - - - -  -  -  -  -   -

evolucao( Termo ) :-
    solucoes( Invariante,+Termo::Invariante,Lista ),
    insercao( Termo ),
    teste( Lista ).

insercao( Termo ) :-
    assert( Termo ).
insercao( Termo ) :-
    retract( Termo ),!,fail.

teste( [] ).
teste( [R|LR] ) :-
    R,
    teste( LR ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado demo: Questao,Resposta -> {V,F}

demo( Questao,verdadeiro ) :-
    Questao.
demo( Questao, falso ) :-
    -Questao.
demo( Questao,desconhecido ) :-
    nao( Questao ),
    nao( -Questao ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :-
    Questao, !, fail.
nao( Questao ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

solucoes( X,Y,Z ) :-
    findall( X,Y,Z ).

comprimento( S,N ) :-
    length( S,N ).
