%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Programacao em logica estendida

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado demo: Questao,Resposta -> {V,F}

demo( Questao,verdadeiro ) :-
    Questao.
demo( Questao,falso ) :-
    -Questao.
demo( Questao,desconhecido ) :-
    nao( Questao ),
    nao( -Questao ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :-
    Questao, !, fail.
nao( Questao ).

voa(X):-
     ave(X), nao(excecao(voa(X))). 
     
-voa(tweety). 

-voa(X):- 
    mamifero(X), nao(excecao(-voa(X))).
    
-voa(X):- 
    excecao(voa(X)). 

voa(X):- 
    excecao(-voa(X)). 

excecao( voa( X )) :- 
    avestruz( X ).
    
excecao( voa( X)) :- 
    pinguim( X ). 
    
excecao(-voa( X )):-
    morcegos( X ).

%------------------  - - -- -  -- - - - - - - - -- - - - - - - - -- - 

ave( X ):- 
    canario( X ). 
    
ave( X ):- 
    avestruz(X). 
    avestruz( trux ). 

ave( X ):- 
    pinguim(X).
    pinguim(pingu). 

ave( X ):- 
    periquitos(X). 

ave( X ):- 
    pitigui(X).  

mamifero( X ):-
    cao( X). 
    cao(boby). 

mamifero( X ):-
    gato( X). 
    
mamifero( X ):-
    morcegos( X ). 
morcegos(batemene).










