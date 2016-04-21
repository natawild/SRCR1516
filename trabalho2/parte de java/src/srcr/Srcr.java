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
                     
                     
                     
                     
                     
                 default:
                     System.out.println("Introduza um numero valido");
             }
           
          
         System.out.println("Prima ENTER para continuar.");
         
         lerString();
         
         
         
         
         
         
         
         
         
         }
         
         
        
        
    }
    
}
