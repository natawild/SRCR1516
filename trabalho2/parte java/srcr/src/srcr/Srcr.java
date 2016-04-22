/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package srcr;


import java.io.IOException;
import se.sics.jasper.SPException;
import static srcr.Input.lerInt;
import static srcr.Input.lerString;

/**
 *
 * @author gil
 */
public class Srcr {
 
    private static final  String path = "C://Users//gil//Documents//Cadeiras//2 semestre//SRCR//trabalho/ex2.pl";
    private static Prolog p;
   
    
 /**
     * @param args the command line arguments
     * @throws se.sics.jasper.SPException
     * @throws java.io.IOException
     */
    public static void main(String[] args) throws SPException, IOException, Exception {
        // TODO code application logic here
        p = new Prolog(path);
       
        int op=-1;
       
      
          
          
         while(op!=0) {
        new Menu();
         
         op=lerInt();
         
         switch (op) {
             case 0: break;
             
             case 1:
                  p.nrUtentes();
                  break;
                     
                 case 2:
                     p.nrServicos();
                     
                     break;
                     
                 case 3:
                     
                     p.nrConsultas();

                     break;
                     
                     
                 case 4:
                    System.out.println("Escreva o nome do utente que deseja procurar");
                     String nome=lerString();
                     p.informacaoUtente(nome);
                     break;
                  
                 case 5:
                     
                     System.out.println("Escreva o nome do servico que deseja procurar");
                      nome=lerString();
                     p.procuraServico(nome);
                     
                     
                     
                     break;
                     
                     
                 case 6:
                     System.out.println("Escreva a data da consulta que deseja procurar");
                     System.out.println("Exemplo data(ano,mes,dia)");
                     String data=lerString();
                     
                     
                     p.consultaData(data);
                     break;
                     
                 case 7:
                      System.out.println("Escreva a data da consulta que deseja procurar");
                     System.out.println("Exemplo data(ano,mes,dia)");
                     data=lerString();
                     
                     System.out.println("Escreva o id do utente que quer consultar");
                     
                     int idU=lerInt();
                    
                     
                    p.utentePagou(data,idU);
                    
                    break;
                    
                    
                    
                 case 8:
                      
                     System.out.println("Escreva o id do utente que quer consultar");
                     
                      idU=lerInt();
                    
                     p.idUtente(idU);
                     
                     break;
                     
                     
                     
                     
                 case 9:
                      System.out.println("Escreva o id do utente que quer consultar");
                     
                      int idS=lerInt();
                    
                     p.idServico(idS);
                     
                     break;
                    
                   
                     
                 case 10:
                      
                     
                     p.dadaDesconhecida();
                     
                     
                     break;
                     
                 case 11:
                     
                      p.custoDesconhecido();
                     
                     
                     break;
                     
                     
                     
                     
                 case 12:
                     
                     p.moradaDesconhecida();
                     
                     
                     break;
                     
                 case 13:
                     System.out.println("Introduza o id do utente");
                     idU=lerInt();
                     
                     System.out.println("Introduza o nome do utente");
                     nome=lerString();
                     
                     System.out.println("Introduza a idade do utente");
                      int idade=lerInt();
                     
                     System.out.println("Introduza a morada do utente");
                     String morada=lerString();
                     
                     p.adicionarUtente(idU,nome,idade,morada);
                    
                     
                     
                     break ;
                     
                 case 14:
                     
                      System.out.println("Introduza o id do servico");
                     idS=lerInt();
                     
                     System.out.println("Introduza o nome do servico");
                     nome=lerString();
                     
                     System.out.println("Introduza a instituicao do servico");
                      String instituicao=lerString();
                     
                     System.out.println("Introduza a cidade da instituicao");
                     String cidade=lerString();
                     
                     
                     p.adicionarServico(idS, nome, instituicao, cidade);
                     
                     
                     
                     
                     break;
                     
                  
                 case 15:
                     
                     System.out.println("Introduza a data da consulta");
                     System.out.println("Exemplo data(ano,mes,dia)");
                      data=lerString();
                     
                     
                     System.out.println("Introduza o id do utente");
                     idU=lerInt();
                     
                     System.out.println("Introduza servico ao qual o utente frequentou");
                      idS=lerInt();
                     
                     System.out.println("Introduza o custo da consulta");
                     int custo=lerInt();
                     
                     
                     p.inserirConsulta(data, idU, idS, custo);

                     break;
                     
                 case 16:
                     
                      System.out.println("Introduza o id do utente que quer remover");
                     idU=lerInt();

                     p.removerUtente(idU);

                     break;
                     
                 case 17: 
                     
                      System.out.println("Introduza o id do servico que quer remover");
                     idS=lerInt();

                     p.removerServico(idS);
                     
                     break;
                     
                 case 18:
                     
                      System.out.println("Introduza a data da consulta");
                     System.out.println("Exemplo data(ano,mes,dia)");
                      data=lerString();
                     
                     
                     System.out.println("Introduza o id do utente");
                     idU=lerInt();
                     
                     System.out.println("Introduza servico ao qual o utente frequentou");
                      idS=lerInt();
                     
                     System.out.println("Introduza o custo da consulta");
                     custo=lerInt();
                     
                     p.removerConsulta(data, idU, idS, custo);
                     break;
                     
                 case 19:
                     
                      System.out.println("Introduza o id do utente");
                     idU=lerInt();
                     
                     System.out.println("Introduza o nome do utente");
                     nome=lerString();
                     
                     System.out.println("Introduza a idade do utente");
                       idade=lerInt();
                     
                     System.out.println("Introduza a morada do utente");
                      morada=lerString();
                     
                     
                     p.demonstracaoUtente(idU,nome,idade,morada);

                     break;
                  
                 case 20:
                    System.out.println("Introduza o id do servico");
                     idS=lerInt();
                     
                     System.out.println("Introduza o nome do servico");
                     nome=lerString();
                     
                     System.out.println("Introduza a instituicao do servico");
                       instituicao=lerString();
                     
                     System.out.println("Introduza a cidade da instituicao");
                     cidade=lerString();
                     
                     
                     p.demonstracaoServico(idS, nome, instituicao, cidade);
                     
                     
                     break;
                     
                 case 21:
                     
                      System.out.println("Introduza a data da consulta");
                     System.out.println("Exemplo data(ano,mes,dia)");
                      data=lerString();
                     
                     
                     System.out.println("Introduza o id do utente");
                     idU=lerInt();
                     
                     System.out.println("Introduza servico ao qual o utente frequentou");
                      idS=lerInt();
                     
                     System.out.println("Introduza o custo da consulta");
                    custo=lerInt();
                     
                     
                     p.demonstracaoConsulta(data, idU, idS, custo);
                     
                     
                     
                     break;
                     
                     
                 default:
                     System.out.println("Introduza um numero valido");
             }
           
          
         System.out.println("Prima ENTER para continuar.");
         
         lerString();
         
         
         
         
         
         
         
         
         
         }
         
         
        
        
    }
    
}
