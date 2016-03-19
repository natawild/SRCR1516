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
:-dynamic instProfi/2.
:-dynamic profUtente/2.
:-dynamic servicoProfi/2.


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
utentinst( manuel, hospitalBraga ).
%-------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado utenserv(utente,servico).

utenserv( jose,endocrinologia). 
utenserv(jose,cardiologia).
utenserv( maria,cardiologia ).
utenserv( carlos, urologia ).  
utenserv( joana, endocrinologia ).  
utenserv( manuel, neurologia ).  
utenserv( manuel, cardiologia ). 


%-------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado instProfi(intituicao,profissional).

instProfi( hospitalBraga,marcus ).
instProfi( hospitalBarcelos,maria ).
instProfi( hospitalLisboaNorte,jorge ).
instProfi( hospitalBeatrizAngelo,celia ).
instProfi( hospitalBraga,maria ).
instProfi( hospitalBarcelos,celia ).
instProfi( hospitalPorto, jorge).
instProfi( hospitalTrofa,vitoria ).
instProfi( hospitalTrofa,jorge ).

%-------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado servicoProfi(profissional,servico).

servicoProfi( marcus,endocrinologia). 
servicoProfi( jorge,cardiologia).
servicoProfi( marcus,cardiologia ).
servicoProfi( vitoria, urologia ).  
servicoProfi(jorge,urologia).


%-------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado profUtente(profissional,utente).

profUtente(marcus,jose).
profUtente(jorge,maria).
profUtente(marcus,maria).
profUtente(jorge,carlos).
profUtente(vitoria,carlos).
profUtente(jorge,carlos).




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
% 1-Identificar os serviços existentes de uma instituicao
% Extensao do predicado  servicoInst  : Instituicao,[servico]->{V,F}


servicoInst(Inst,Serv):-findall(K,instserv(Inst,K),Serv).      

servicoInst(Inst,[Serv|K]):- instserv(Inst,Serv),servicoInst(Inst,K).

servicoInst(Inst,[Serv]):- instserv(Inst,Serv).

servicoInst(Inst,[]).




%-------------------------- - - - - - - - - - -  -  -  -  -   -         
% 2-Identificar os utentes de uma instituicao
% Extensao do predicado  utentesInst  : Instituicao,[utentes]->{V,F}


utentesInst(Inst,Uten):-findall(K,utentinst(K,Inst),Uten).      

utentesInst(Inst,[Uten|K]):- utentinst(Uten,Inst),utentesInst(Inst,K).

utentesInst(Inst,[Uten]):-utentinst(Uten,Inst).

utentesInst(Inst,[]).



%-------------------------- - - - - - - - - - -  -  -  -  -   -         
% 3-Identificar os utentes de um determinado servico
% Extensao do predicado  utentesServ  : [utentes],servico>{V,F}

servUtente(Serv,Ute):- findall(K,utenserv(K,Serv),Ute).

servUtente(Serv,[Ute|K]):- utenserv(Ute,Serv), servUtente(Serv,K).

servUtente(Serv,[Ute]):- utenserv(Serv,Ute).

servUtente(Serv,[]).


%-------------------------- - - - - - - - - - -  -  -  -  -   -
% 4- Identificar os utentes de um determinado servico numa instituicao

% Extensao do predicado utenservinst:(servico, instituicao,[utentes])->{V,F}

utenServInst(Serv,Inst,Uten):- findall(K,(utenserv(K,Serv),utentinst(K,Inst),instserv(Inst,Serv)),Uten). 

utenServInst(Serv,Inst,[Uten|K]):- utenserv(Uten,Serv),
                                   utentinst(Uten,Inst),
                                   instserv(Inst,Serv),
                                   utenServInst(Serv,Inst,K).


utenServInst(Serv,Inst,[Uten]):- utenserv(Uten,Serv),
                                   utentinst(Uten,Inst),
                                   instserv(Inst,Serv).

utenServInst(Serv,Inst,[]).

%-------------------------- - - - - - - - - - -  -  -  -  -   -
% 5-Identificar as instituições onde seja prestado um dado serviço ou conjunto de serviços;

% Extensao do predicado instServico: ([Serviço],[Instituição])->{V,F}    
 
instServico(Serv,I):-    
	findall(H,instserv(H,Serv),I).  /* vai procurar os hospitais que tenham um dado servico e guarda-os na lista I    */ 
         
instServicos([],[]).   
instServicos([S|T],I):-    
	instServico(S,I1),   
	instServicos(T,I2),concat(I1,I2,I).
         
         



%-------------------------- - - - - - - - - - -  -  -  -  -   -         
% 6-Identificar os serviços que não se podem encontrar numa instituição;

% Extensao do predicado servicosForaInst : Instituicao,Serviço->{V,F}

 todosServicos(L):-
	findall(S,servico(S),L).


servicosForaInst(Ins,Serv):-todosServicos(P), 
                           servicoInst(Ins,K),
                           difList(P,K,Serv).
                             


%-------------------------- - - - - - - - - - -  -  -  -  -   -         
% 7-Determinar as instituições onde um profissional presta servico;

% Extensao do predicado profiServico : profissional,[instituições]->{V,F}


profiServico(Prof,Inst):- findall(K,instProfi(K,Prof),Inst).

profiServico(Prof,[Inst|K]):-instProfi(Inst,Prof),
                             profiServico(Prof,K).

profiServico(Prof,[Inst]):-instProfi(Inst,Prof).

profiServico(Prof,[]).

%-------------------------- - - - - - - - - - -  -  -  -  -   -         
% 8-Determinar todas as instituições(ou serviços, ou profissionais) a que um utente ja recorreu

% Extensao do predicado instSerProf: profissional,[instituições]->{V,F}
