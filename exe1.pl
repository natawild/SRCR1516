%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Base de Conhecimento do registo de eventos numa instituição de saúde

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

-------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado utenserv(utente,servico).

utenserv( jose, endocrinologia ). 
utenserv( maria, cardiologia ).
utenserv( carlos, urologia ).  
utenserv( joana, endocrinologia ).  
utenserv( manuel, neurologia ).  


-------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado utenservinst:(utente,servico, instituicao)->{V,F}

ok(X,Y,Z):-
    utenserv(X, Y),
    utentinst(X,Z),
    instserv(Z,Y). 
         
         













