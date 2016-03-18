%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Base de Conhecimento do registo de eventos numa instituição de saúde

:- op( 900,xfy,'::' ).
/* permitir adicionar a base de conhecimento	*/
:-dynamic utentes/1.
:-dynamic instituicao/1.
:-dynamic servico/1.
:-dynamic profissional/1.
:-dynamic instserv/2.
:-dynamic utenserv/2, utentinst/2. 
:-dynamic ok/3.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado instituição(nome). 

instituicao( hospitalGuimaraes ). 
instituicao( hospitalBraga ).
instituicao( hospitalBarcelos ).
instituicao( hospitalPorto ).
instituicao( universitarioCoimbra ).
instituicao( hospitalLisboaNorte ).
instituicao( hospitalBeatrizAngelo ).
instituicao( hospitalTrofa ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado servico(nome).

servico( cardiologia ). 
servico( cirugiageral ).
servico(  neurologia ).
servico(  ortopedia ).
servico(  psiquiatria ).
servico(  oftamologia ).
servico(  ginecologia/obstetricia ).
servico(  oncologia ).
servico(  endocrinologia ).
servico(  urologia ).  

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado utente(nome).
       
utente( jose ).  
utente( carlos ). 
utente( maria ). 
utente( carlos ).   
utente( antonio ). 
utente( manuel ).  
utente( joana ).   

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado profissional(nome).
  
profissional( marcus ).
profissional( maria ).
profissional( jorge ).
profissional( celia ).
profissional( carlos ).
profissional( antonio ).
profissional( vitoria ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado instserv(intituicao,servico).

instserv( hospitalBraga, cardiologia ).
instserv( hospitalBeatrizAngelo, endocrinologia ).
instserv( hospitalBraga, oncologia ).
instserv( hospitalPorto, cardiologia ).
instserv( hospitalPorto, psiquiatria ).
instserv( hospitalTrofa, urologia ).
instserv( hospitalBarcelos, oftamologia ).
instserv( hospitalBarcelos, endocrinologia ).
instserv( hospitalGuimaraes, neurologia ).
instserv( hospitalLisboaNorte,  neurologia).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado utentinst(utente,instituicao).

utentinst( jose, hospitalBarcelos ). 
utentinst( maria, hospitalPorto ).
utentinst( carlos, hospitalTrofa ). 
utentinst( jose, hospitalBraga ).
utentinst( joana, hospitalBeatrizAngelo ). 
utentinst( manuel, hospitalLisboaNorte ). 

%-------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado utenserv(utente,servico).

utenserv( jose,endocrinologia). 
utenserv(jose,cardiologia).
utenserv( maria,cardiologia ).
utenserv( carlos, urologia ).  
utenserv( joana, endocrinologia ).  
utenserv( manuel, neurologia ).  

%-------------------------- - - - - - - - - - -  -  -  -  -   -
printLista([]):-write('').
printLista([H|T]):-
	write(H),nl,
	printLista(T).

%-------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado concat:(Lista,Lista,Lista)->{V,F}

concat([],L,L).
concat([X|L1],L2,[X|L3]):- concat(L1,L2,L3).



%-------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado nao
nao( Questao) :-
	Questao, !,fail.
nao(Questao).


%-------------------------- - - - - - - - - - -  -  -  -  -   -
difList([],_,[]).
difList([H1|T1],L2,[H1|L3]):-
	nao(member(H1,L2)), difList(T1,L2,L3).
difList([_|T1],L2,L3):-
	difList(T1,L2,L3).


%-------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado utenservinst:(utente,servico, instituicao)->{V,F}

utenservinst(X,Y,Z):-
     utenserv(X,Y),
     utentinst(X,Z),
     instserv(Z,Y),
     utente(X),
     instituicao(Z),
     servico(Y).
%-------------------------- - - - - - - - - - -  -  -  -  -   -
% Identificar as instituições onde seja prestado um dado serviço ou conjunto de serviços;

% Extensao do predicado instServico: ([Serviço],[Instituição])->{V,F}    
 
instServico(Serv,I):-    
	findall(H,instserv(H,Serv),I).  /* vai procurar os hospitais que tenham um dado servico e guarda-os na lista I    */ 
         
instServicos([],[]).   
instServicos([S|T],I):-    
	instServico(S,I1),   
	instServicos(T,I2),concat(I1,I2,I).
         
         
%--------------------------- --- - - - -- - -- - - - -  - -- - - -

% Indentificar os serviços existentes numa instituicao

% Extensao do predicado existeServInst : [Serviço],Instituição->{V,F}
existeServInst(Serv,I):- 
                       findall(K,instserv(I,K),Serv). 
         
         
         
%-------------------------- - - - - - - - - - -  -  -  -  -   -         
% Identificar os serviços que não se podem encontrar numa instituição;

% Extensao do predicado servicosForaInst : Instituicao,Serviço->{V,F}

 todosServicos(L):-
	findall(S,servico(S),L).

servicosForaInst(Ins,Serv):-todosServicos(P), 
                            existeServInst(K,Ins),
                            difList(P,K,Serv).
                             
                             
                             
                             
                                   

 
         












