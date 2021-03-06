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


:-dynamic utente/4.
:-dynamic servico/4.
:-dynamic consulta/4.

% Extensao do predicado utente(IdUten,Nome,Idade,Morada) ->{V,F,D}

utente(1,gil,12,rua_Braga).

utente(20,gil,12,rua_Braga).

utente(2,carlos,20,rua_Guimaraes).
utente(3,sandro,30,rua_Lisboa).
utente(4,ana,10,rua_Varzim).
utente(5,filipa,15,rua_Coimbra).
utente(6,antonio,13,rua_Pacos).
utente(7,filipe,13,rua_Guimaraes).

-utente(ID,N,I,M):- nao(utente(ID,N,I,M)),
                    nao(excecao(utente(ID,N,I,M))).




-utente(13,joaquim,60,rua_Fafe).


% Nao sabemos a morada nem nunca vamos deixar saber que se saiba

utente(8,johnny,10,morada_desconhecido).

excecao(utente(ID,NO,I,R)):- utente(ID,NO,I,morada_desconhecido).

nulo(morada_desconhecido).



+utente(ID,NO,I,R) :: (solucoes( (ID,NO,I,R),(utente(ID,johnny,I,R),nao(nulo(R))),S ),
                               comprimento( S,N ), N == 0 
                                  ).
								  
% Nao sabemos se mora em guimaraes ou em fafe							  

excecao(utente(9,carlos,60,guimaraes)).
excecao(utente(9,carlos,60,fafe)).								  
								  

% Nao sabemos a idade ao certo do utente 

excecao(utente(10,lourenco,I,fafe)):- (I>=30,I=<40).

utente(11,filipe,30,morada_desconhecido).
utente(12,celia,22,morada_desconhecido).									 


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado servico(ID,Descricao,Instituicao,Cidade) ->{V,F,D}


servico(1,cardiologia,hospital_Braga,braga).
servico(2,urologia,hospital_Braga,braga).
servico(3,neurologia,hospital_Guimaraes,guimaraes). 
servico(4,cirugia_Geral,hospital_Guimaraes,guimaraes).
servico(5,ortopedia,hospital_Coimbra,coimbra).
servico(6,psiquiatria,hospital_Fafe,fafe).
servico(7,ginecologia,hospital_Fafe,fafe).
servico(10,cardiologia,hospital_Lisboa,lisboa).
 

-servico(ID,D,I,C):- nao(servico(ID,D,I,C)),
                    nao(excecao(servico(ID,D,I,C))).



% Nao sabemos se endocrinologia é prestado no hospital_Fafe ou no de hospital_Fafe_Novo				
					
excecao(servico(8,endocrinologia,hospital_Fafe,fafe)).
excecao(servico(8,endocrinologia,hospital_Fafe_Novo	,fafe)).



					
					
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado consulta(Data,IDUtente,IDServico,Custo) ->{V,F,D}
% data (ano,mes,dia)


consulta(data(2010,1,10),1,1,200).
consulta(data(2011,2,11),2,2,20).
consulta(data(2012,3,12),3,3,210).
consulta(data(2013,4,13),4,4,220).
consulta(data(2014,5,14),5,5,24).
consulta(data(2015,6,15),6,6,26).


-consulta(D,IDU,IDS,C):- nao(consulta(D,IDU,IDS,C)),
                           nao(excecao(consulta(D,IDU,IDS,C))).
						   


% Nunca podemos saber a data em que o utente realizou uma consulta de um determinado servico

consulta(data_desconhecida,7,1,200). 
nulo(data_desconhecida).

excecao(consulta(D,IDU,IDS,C)):-consulta(data_desconhecida,IDU,IDS,C).

+consulta(D,IDU,IDS,C) :: (solucoes( (D,IDU,IDS,C),(consulta(D,7,1,C),nao(nulo(D))),S ),
                               comprimento( S,N ), N == 0 
                                  ).


% Nao sabemos quanto ele pagou por um determinado servico

excecao(consulta(D,IDU,IDS,C)):- consulta(D,IDU,IDS,custo_desconhecido).

consulta(data(2014,6,15),1,2,custo_desconhecido).

% Nao sabemos ao serto quanto ele pegou por um determinado servico

excecao(consulta(data(2015,6,15),1,3,C)):- (C>=10,C=<100).



% Nunca podemos vir a saber que tipo de servico o utente teve naquela data 

consulta(data(2015,6,15),1,servico_desconhecido,20).
nulo(servico_desconhecido).
excecao(consulta(D,ID,IDS,C)):- consulta(D,ID,servico_desconhecido,C).

+consulta(D,ID,IDS,C) :: (solucoes((D,ID,IDS,C),(consulta(data(2015,6,15),1,IDS,C),nao(nulo(IDS))),S),comprimento(S,N),N==0).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado que permite a insercao de conhecimento: Termo -> {v, F}
 
inserirUtente(ID,NO,I,M):-evolucao(utente(ID,NO,I,M)).
inserirServico(ID,D,I,C):-evolucao(servico(ID,D,I,C)).
inserirConsulta(D,IDU,IDS,C):-evolucao(consulta(D,IDU,IDS,C)).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado que permite a remocao de conhecimento: Termo -> {v, F}

removerUtente(ID,NO,I,M):-remover(utente(ID,NO,I,M)).
removerServico(ID,NO,I,C):-remover(servico(ID,NO,I,C)).
removerConsulta(D,IDU,IDS,C):-remover(consulta(D,IDU,IDS,C)).


% Contar o numero de utentes

conta_Utente(Numero):-(findall((ID,N,I,M),(utente(ID,N,I,M)),S),comprimento(S,Tamanho), Numero is Tamanho).



% Contar o numero de Servicos

conta_Servico(Numero):-(findall((ID,N,I,M),servico(ID,N,I,M),S),comprimento(S,Tamanho), Numero is Tamanho).

% Contar o numero de Consultas

conta_Consulta(Numero):-(findall((ID,N,I,M),consulta(ID,N,I,M),S),comprimento(S,Tamanho), Numero is Tamanho).



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
	
	
	
	
/* ==================Invariante========================*/


% Nao deixa inserir o mesmo conhecimento em relacao aos utentes

+utente(ID,NO,I,M) :: (solucoes((ID,NO,I,M),utente(ID,NO,I,M),S),comprimento(S,N), N==1).

% Nao deixa inserir o mesmo id em relacao aos utentes

+utente(ID,_,_,_) :: (solucoes(NO,utente(ID,NO,_,_),S),comprimento(S,N), N==1).


/*=======Servicos ==============*/ 
					 
% Nao deixa inserir o mesmo conhecimento em relacao aos servicos

+servico(ID,D,I,C) :: (solucoes((ID,D,I,C),servico(ID,D,I,C),S),comprimento(S,N),N==1).


% Nao deixa inserir servicos com o mesmo ID

+servico(ID,_,_,_) :: (solucoes(D,servico(ID,D,_,_),S),comprimento(S,N),N==1).

/*=======Consultas ==============*/ 

% Nao deixa inserir o mesmo conhecimento em relacao as consultas

+consulta(D,IDU,IDS,C) :: (solucoes((D,IDU,IDS,C),consulta(D,IDU,IDS,C),S),comprimento(S,N),N==1).

% So podemos adicionar consultar se o id do utente existir 

+consulta(_,ID,_,_) :: (solucoes(NO,utente(ID,NO,_,_),S),comprimento(S,N),N==1).

% So podemos adicionar consultar se o id do servico existir

 
+consulta(_,_,IDS,_) :: (solucoes(NO,servico(IDS,NO,_,_),S),comprimento(S,N),N==1).

					   
/*===========Remover===================*/

% Nao deixar remover utentes que estejam nas consultas

-utente(ID,_,_,_) :: (nao(consulta(_,ID,S,_)),nao(utente(ID,_,_,_))).

/*=========Servicos =============*/
% Nao deixar remover um servico que esta nas consultas 

-servico(ID,X,Y,Z) :: (nao(consulta(P,L,ID,K)),nao(servico(ID,X,Y,Z))).





						   
						  

