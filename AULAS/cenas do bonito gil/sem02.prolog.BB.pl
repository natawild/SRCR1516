%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Base de Conhecimento com informacao genealogica.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado filho: Filho,Pai -> {V,F}

:- dynamic filho/2.
:- dynamic pai/2.

filho( joao,jose ).
filho( jose,manuel ).
filho( carlos,jose ).
filho(filipe,paulo).

%--------------------------------------------
% Extensao do predicado neto : Neto,Avo ->{V,F}
:- dynamic neto/2.
:- dynamic avo/2.

neto(nadia,antonio).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pai: Pai,Filho -> {V,F}

pai( P,F ) :-
    filho( F,P ).

	
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado avo: Avo,Neto -> {V,F}
avo(A,N) :- filho(N,X),pai(A,X).




%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisavo: Bisavo,Bisneto -> {V,F}




%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente -> {V,F}







%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente,Grau -> {V,F}





