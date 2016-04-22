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
:- dynamic filho/2.
:- dynamic pai/2.




%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pais: Filho,Pai,Mae -> {V,F,D}

pais( ana,abel,alice ).
pais(anibal,antonio,alberta).
pais(berta,bras,belem).
pais(berto,bras,belem).

pais(catia,xpto023,xpto024).

pais(daniel,danilo,xpto024).

pais(eurico,elias,elsa).






excecao(pais(crispim,celso,catia)).
excecao(pais(crispim,caio,catia)).




-pais(F,P,M):-nao(pais(F,P,M)),
              nao(excecao(pais(F,P,M))).
			  
	


excecao(pais(F,P,M)):- pais(F,xpto023,M).
	
	
	
	
	
pais(filha_desc,fausto,xpto024).

excecao(pais(F,P,M)):- pais(F,P,xpto024).

excecao(pais(fabia,fausto,Mae)).

excecao(pais(octavia,fausto,Mae)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
nascimento(helder,xpto030).

excecao(nascimento(X,Y)):- nascimento(X,xpto030).


			  


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado nascimento: Individo,Data(D,M,A) -> {V,F,D}
nascimento(ana,data(01,01,2010)).
nascimento(anibal,data(02,01,2010)).
nascimento(berta,data(02,01,2010)).
nascimento(berto,data(02,01,2010)).
nascimento(catia,data(03,03,2010)).
nascimento(daniel,data(04,04,2010)).

excecao(nascimento(eurico,data(5,5,2010))).
excecao(nascimento(eurico,data(6,5,2010))).

-nascimento(F,data(D,M,A)):-nao(nascimento(F,data(D,M,A))),
                            nao(excecao(nascimento(F,data(D,M,A)))).



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
