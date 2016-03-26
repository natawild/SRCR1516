%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Base de Conhecimento do registo de eventos numa instituição de saúde

%--------------------------------- - - - - - - - - - - - - - - -
% SICStus PROLOG: Declaracoes iniciais

:- op( 900,xfy,'::' ).
:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).


/* permitir adicionar a base de conhecimento	*/


:-dynamic utente/2.
:-dynamic instituicao/1.
:-dynamic profissional/2.
:-dynamic servico/1.

%--------------------------------- Base de Conhecimento - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado instituição(nome). 

instituicao( hospital_guimaraes ). 
instituicao( hospital_braga ).
instituicao( hospital_barcelos ).
instituicao( hospital_porto ).
instituicao( universitario_coimbra ).
instituicao( hospital_lisboa_norte ).
instituicao( hospital_beatriz_angelo ).
instituicao( hospital_trofa ).

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
% Extensao do predicado utente(codigo,nome).
       
utente(1,jose).  
utente(2,carlos). 
utente(3,maria). 
utente(4,jose).   
utente(5,antonio). 
utente(6,manuel).  
utente(7,joana).
utente(8,joana).  

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado profissional(codigo,nome).
  
profissional(1,marcus).
profissional(2,maria).
profissional(3,jorge).
profissional(4,celia).
profissional(5,carlos).
profissional(6,antonio).
profissional(7,vitoria ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado ins_serv_uten_profi(intituicao,servico,Codigo utente,Codigo profissional).

ins_serv_uten_profi( hospital_braga, cardiologia,1,1 ).
ins_serv_uten_profi( hospital_trofa, cardiologia,1,1 ).
ins_serv_uten_profi( hospital_beatriz_angelo, endocrinologia,2,2 ).
ins_serv_uten_profi( hospital_braga, oncologia,3,3 ).
ins_serv_uten_profi( hospital_porto, cardiologia,4,4 ).
ins_serv_uten_profi( hospital_porto, psiquiatria,5,5 ).
ins_serv_uten_profi( hospital_trofa, urologia,6,6 ).
ins_serv_uten_profi( hospital_barcelos, oftamologia,7,7 ).
ins_serv_uten_profi( hospital_barcelos, endocrinologia,1,2 ).
ins_serv_uten_profi( hospital_guimaraes, neurologia,3,2 ).
ins_serv_uten_profi( hospital_lisboa_norte,  neurologia,4,5).


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



%-------------------------- - - - - - - - - - -  -  -  -  -   -         
% 1-Identificar os serviços existentes de uma instituicao
% Extensao do predicado  servicoInst  : Instituicao,[servico]->{V,F}


servicoInst(Inst,Serv):-findall(K,ins_serv_uten_profi(Inst,K,_,_),Serv).      

servicoInst(Inst,[Serv|K]):- ins_serv_uten_profi(Inst,Serv,_,_),
                             servicoInst(Inst,K).

servicoInst(Inst,[Serv]):- ins_serv_uten_profi(Inst,Serv,_,_).



%-------------------------- - - - - - - - - - -  -  -  -  -   -         
% 2-Identificar os utentes de uma instituicao
% Extensao do predicado  utentesInst  : Instituicao,[utentes]->{V,F}


utentesInst(Inst,Uten):-findall((K,J),(ins_serv_uten_profi(Inst,_,K,_),utente(K,J)),Uten).      

utentesInst(Inst,[(Cod,Uten)|K]):- ins_serv_uten_profi(Inst,_,Cod,_),
                                   utente(Cod,Uten),
                                    utentesInst(Inst,K).

utentesInst(Inst,[(Cod,Uten)]):-ins_serv_uten_profi(Inst,_,Cod,_),
                                utente(Cod,Uten).



%-------------------------- - - - - - - - - - -  -  -  -  -   -         
% 3-Identificar os utentes de um determinado servico
% Extensao do predicado  servUtente  : servico,[utentes]->{V,F}

servUtente(Serv,Ute):-
    findall((K,J),(ins_serv_uten_profi(_,Serv,K,_),utente(K,J)),Ute).

servUtente(Serv,[(Cod,Uten)|K]):- ins_serv_uten_profi(_,Serv,Cod,_),
                                  utente(Cod,Uten), 
                                  servUtente(Serv,K).

servUtente(Serv,[(Cod,Uten)]):- ins_serv_uten_profi(_,Serv,Cod,_),
                                   utente(Cod,Uten).



%-------------------------- - - - - - - - - - -  -  -  -  -   -
% 4- Identificar os utentes de um determinado servico numa instituicao

% Extensao do predicado utenservinst:(servico, instituicao,[utentes])->{V,F}

utenServInst(Serv,Inst,Uten):- 
    findall((K,J),(ins_serv_uten_profi(Inst,Serv,K,_),utente(K,J)),Uten). 

utenServInst(Serv,Inst,[(Cod,Uten)|K]):- utente(Cod,Uten),
                                   ins_serv_uten_profi(Inst,Serv,Cod,_),
                                   utenServInst(Serv,Inst,K).


utenServInst(Serv,Inst,[(Cod,Uten)]):- ins_serv_uten_profi(Inst,Serv,Cod,_),
                                   utente(Cod,Uten).



%-------------------------- - - - - - - - - - -  -  -  -  -   -
% 5-Identificar as instituições onde seja prestado um dado serviço ou conjunto de serviços;
% Extensao do predicado instServico: ([Serviço],[Instituição])->{V,F}    
 
 instServicos([Serv|K],I):-    
	findall(H,servicoInst(H,[Serv|K]),L),
    eliminarRepetidos(L,I).


inst_Servico(S,[I|K]):- servicoInst(I,[S]),
    inst_Servico(S,K).  
    
inst_Servico(S,[I]):- servicoInst(I,[S]).


instServicos([S|T],[I|K]):-inst_Servico(S,[I|K]),instServicos(T,[I|K]).
instServicos([S],[I|K]):-inst_Servico(S,[I|K]).
instServicos([S],[I]):-inst_Servico(S,[I]).



%-------------------------- - - - - - - - - - -  -  -  -  -   -         
% 6-Identificar os serviços que não se podem encontrar numa instituição;

% Extensao do predicado servicosForaInst : Instituicao,Serviço->{V,F}

todosServicos(L):-
	findall(S,servico(S),L).

servicosForaInst(Ins,Serv,todos):-todosServicos(P), 
                           servicoInst(Ins,K),
                           difList(P,K,Serv).

servicosForaInst(Ins,[Serv|K]):-nao(servicoInst(Ins,[Serv|K])).

                                                    

%-------------------------- - - - - - - - - - -  -  -  -  -   -         
% 7-Determinar as instituições onde um profissional presta servico;
% Extensao do predicado profiServico : profissional,[instituições]->{V,F}


profiServico((Cod,Prof),Inst):- 
    findall(K,(ins_serv_uten_profi(K,_,_,Cod),profissional(Cod,Prof)),Inst).

profiServico((Cod,Prof),[Inst|K]):-ins_serv_uten_profi(Inst,_,_,Cod),
                              profissional(Cod,Prof),
                               profiServico((Cod,Prof),K).

profiServico((Cod,Prof),[Inst]):-ins_serv_uten_profi(Inst,_,_,Cod),
                                 profissional(Cod,Prof).



%-------------------------- - - - - - - - - - -  -  -  -  -   -         
% 8-Determinar todas as instituições(ou serviços, ou profissionais) a que um utente ja recorreu
% Extensao do predicado instSerProf: utente,instituicao ou servico ou profissional->{V,F}

% Instituicao
instSerProf((Cod,Uten),Inst,inst):- findall(K,(ins_serv_uten_profi(K,_,Cod,_),utente(Cod,Uten)),L),
                                    eliminarRepetidos(L,Inst).

instSerProf((Cod,Uten),[Inst|K]):-ins_serv_uten_profi(Inst,_,Cod,_),
                            utente(Cod,Uten),
                            instSerProf((Cod,Uten),K).

instSerProf((Cod,Uten),[Inst]):-ins_serv_uten_profi(Inst,_,Cod,_),
                                 utente(Cod,Uten).


%Servico

instSerProf((CodU,Uten),Serv,serv):- findall(K,(ins_serv_uten_profi(_,K,CodU,_),utente(CodU,Uten)),L),
                                    eliminarRepetidos(L,Serv).

instSerProf((CodU,Uten),[Serv|K]):-ins_serv_uten_profi(_,Serv,CodU,_),
                                   utente(CodU,Uten),
                                   instSerProf((CodU,Uten),K).


instSerProf((CodU,Uten),[Serv]):-ins_serv_uten_profi(_,Serv,CodU,_),
                                  utente(CodU,Uten).


%Profissional

instSerProf((CodU,Uten),Prof,prof):- findall((K,Nome),(ins_serv_uten_profi(_,_,CodU,K),utente(CodU,Uten),profissional(K,Nome)),L),
                                    eliminarRepetidos(L,Prof).

instSerProf((CodU,Uten),[(CodP,Prof)|K]):-ins_serv_uten_profi(_,_,CodU,CodP),
                                profissional(CodP,Prof),
                              utente(CodU,Uten),
                              instSerProf((CodU,Uten),K).

instSerProf((CodU,Uten),[(CodP,Prof)]):-ins_serv_uten_profi(_,_,CodU,CodP),
                                        profissional(CodP,Prof),
                                        utente(CodU,Uten).




%-------------------------- - - - - - - - - - -  -  -  -  -   -         
% 9-Registar utentes, profissionais, servicos ou instituicoes;

% Extensao do predicado regista: utente,instituicao,servico ou profissional->{V,F}

adicionarUtentes(Codigo,Utente):- inserirConhecimento(utente(Codigo,Utente)).

adicionarServico(Servico):- inserirConhecimento(servico(Servico)).

adicionarProfissional(Codigo,Profissional):- inserirConhecimento(profissional(Codigo,Profissional)).

adicionarInstituicao(Nome):- inserirConhecimento(instituicao(Nome)).


%-------------------------- - - - - - - - - - -  -  -  -  -   -         
% 10-Remover utentes, profissionais, servicos ou instituicoes;

% Extensao do predicado regista: utente,instituicao,servico ou profissional->{V,F}
removerUtentes(Codigo,Utente):- remover(utente(Codigo,Utente)).

removerServico(Servico):- remover(servico(Servico)).

removerProfissional(Codigo,Profissional):- remover(profissional(Codigo,Profissional)).

removerInstituicao(Nome):- remover(instituicao(Nome)).




/* ################# MECANISMOS ####################*/

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
% Extensão do predicado comprimento: L, R -> {V, F}

comprimento([], 0).
comprimento([_|T], R) :-
	comprimento(T, X),
	R is 1+X.



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado que permite a inserção de conhecimento: Termo -> {v, F}

inserirConhecimento(Termo) :-
	solucoes( Invariante, +Termo::Invariante, Lista),
	insercao(Termo),
	teste( Lista ).

insercao(Termo) :-
	assert(Termo).
insercao(Termo)	:-
	retract(Termo), !, fail.

teste([]).
teste([H|T]) :-
	H, teste(T).	


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado que permite a remoção de conhecimento: Termo -> {v, F}

remover(Termo):-
	solucoes(Inv,-Termo::Inv,LInv),
	remocao(Termo),
	teste(LInv).

remocao(Termo):-
	retract(Termo).
remocao(Termo):-
	assert(Termo),!,fail.


/* #######Invariantes############*/

% Nao deixa introduzir o mesmo conhecimentos
+utente(Codigo,Uten) :: (solucoes( (Codigo,Uten), utente(Codigo,Uten), S),comprimento(S,N),N==1).

% Nao deixa inserir utentes com o mesmo codigo
+utente(Codigo,_) :: (solucoes( Uten, utente(Codigo,Uten), S),comprimento(S,N),N==1 ).

% Nao deixa introduzir nomes iguas para as instituicoes
+instituicao(Nome) :: (solucoes( Nome, instituicao(Nome), S),comprimento(S,N),N==1 ). 

% Nao deixa introduzir nomes iguais para os servico
+servico(Nome) :: (solucoes( Nome, servico(Nome), S),comprimento(S,N),N==1). 

% Nao deixa introduzir o mesmo conhecimentos
+profissional(Codigo,Prof) :: (solucoes( (Codigo,Prof), profissional(Codigo,Prof), S),comprimento(S,N),N==1 ).

% Nao deixa inserir profissionais com o mesmo codigo
+profissional(Codigo,_) :: (solucoes( Prof, profissional(Codigo,Prof), S),comprimento(S,N),N==1 ).


/* ########## Remover #############*/

% Nao deixar remover um paciente enquanto estiver a ser consultado por um profissional, ou estiver num servico ou numa instituicao
-utente(Codigo,Nome) :: (nao(ins_serv_uten_profi(_,_,Codigo,_)),nao(utente(Codigo,Nome))).


% Nao deixar remover um profissional enquanto estiver a ser consultado por um profissional, ou estiver num servico ou numa instituicao
-profissional(Codigo,Nome) :: (nao(ins_serv_uten_profi(_,_,_,Codigo)),nao(profissional(Codigo,Nome))).


% Nao deixar remover um servico com profissionais a trabalhar nele ou utentes a usar-lo, ou estar na instituicao
-servico(Nome) :: (nao(ins_serv_uten_profi(_,Nome,_,_))).


% Nao deixar remover uma instituicao com profissionais, utentes, ou servicos
-instituicao(Nome) :: (nao(ins_serv_uten_profi(Nome,_,_,_))).




/*##############Extras###############################*/
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Numero de serviços existentes num hospital.
% Extensão do predicado numero_Servico: Instituicao,Numero -> {v, F}

numero_Servico(Inst,N):- servicoInst(Inst,K),comprimento(K,Contador), 
                        N is Contador.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Numero de profissionais existentes num hospital.
% Extensão do predicado numero_Profissionais: Instituicao,Numero -> {v, F}

numero_Profissionais(Inst,N):- findall(Prof,ins_serv_uten_profi(Inst,_,_,Prof),L),
                               comprimento(L,Contador),
                               N is Contador.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Numero de utentes existentes num hospital.
% Extensão do predicado numero_Utentes: Instituicao,Numero -> {v, F}


numero_Utentes(Inst,N):- utentesInst(Inst,K),comprimento(K,Contador), N is Contador.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Numero de utentes que estao num certo servicos num dado hospital
% Extensão do predicado numero_Utentes_Int_Serv: Instituicao,Servico,Numero -> {v, F}

numero_Utentes_Int_Serv(Inst,Serv,N):- findall(K,ins_serv_uten_profi(Inst,Serv,K,_),L),comprimento(L,Contador), N is Contador.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Numero de hospitais disponivel na base de conhecimento
% Extensão do predicado numero_Ins: Numero -> {v, F}

numero_Ins(Numero):-findall(K,instituicao(K),Z),comprimento(Z,Contador),Numero is Contador. 


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Numero de servicos disponivel na base de conhecimento
% Extensão do predicado numero_Servico: Numero -> {v, F}

numero_Servico(Numero):-findall(K,servico(K),Z),comprimento(Z,Contador),Numero is Contador. 

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Numero de utentes disponivel na base de conhecimento
% Extensão do predicado numero_Utentes: Numero -> {v, F}

numero_Utentes(Numero):-findall((J,K),utente(J,K),Z),comprimento(Z,Contador),Numero is Contador. 


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado numero_Profissionais: Numero -> {v, F}
%Numero de profissionais disponivel na base de conhecimento

numero_Profissionais(Numero):-findall((J,K),profissional(J,K),Z),comprimento(Z,Contador),Numero is Contador. 


/*#######Invariantes########*/ 

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Nao deixar que insira um hospital, servico, utente ou profissional que nao exista

+ins_serv_uten_profi(Inst,Serv,CodUten,CodProf) :: (solucoes((Inst,Serv,CodUten,CodProf),(utente(CodUten,_),profissional(CodProf,_),instituicao(Inst),servico(Serv)),K),
                                                   comprimento(K,N),N==1).
                                              


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Nao deixar inserir conhecimento repetido


+ins_serv_uten_profi(Inst,Serv,CodUten,CodProf) :: (solucoes((Inst,Serv,CodUten,CodProf),(ins_serv_uten_profi(Inst,Serv,CodUten,CodProf)),K),
                                                   comprimento(K,N),N==1).




adicionarInstServico(Inst,Serv,CodUten,CodProf):- inserirConhecimento(ins_serv_uten_profi(Inst,Serv,CodUten,CodProf)).

removerInstServico(Inst,Serv,CodUten,CodProf):- remover(ins_serv_uten_profi(Inst,Serv,CodUten,CodProf)).
































