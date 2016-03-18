%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Base de Conhecimento do registo de eventos numa instituição de saúde

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado instituição: (codigo,nome)->{V,F} 

instituicao( 1, Hospital de Guimarães ). 
instituicao( 2, Hospital S.Marcus Braga ).
instituicao( 3, Hospital de Barcelos ).
instituicao( 4, Hospital de São João Porto ).
instituicao( 5, Universitário de Coimbra ).
instituicao( 6, Hospital Lisboa Norte ).
instituicao( 7, Hospital Beatriz Angelo ).
instituicao( 8, Hospital da Trofa ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado servico: ([instituicao],nome)->{V,F} 


servico( [1,2,3,4,5,6], cardiologia ). 
servico( [1,2,5,6], cirugia geral ).
servico( [4,5,6,7], neurologia ).
servico( [4,5,6], ortopedia ).
servico( [1,2,3,4,5,6], psiquiatria ).
servico( [1,3,4,5,6,7], oftamologia ).
servico( [1,2,3,4,5,6], ginecologia/obstetricia ).
servico( [2,3,5,6], oncologia ).
servico( [1,2,3,4,5,6], endocrinologia ).
servico( [3,4,5,6,7,8], urologia ).  

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado utente: ([codigo instituicao],[servico],nome)->{V,F}

       
       
utente( [1,2,3,4,5,8],[], jose ).  
utente( [],[], carlos ).  





%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado profissional: ([codigo instituicao],[servico],nome)->{V,F}
  
profissional([2,3],[cardiologia], marcus ).
profissional([2,3,5],[oncologia], maria ).





