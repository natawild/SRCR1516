/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package srcr;

import java.util.HashMap;
import se.sics.jasper.Query;
import se.sics.jasper.SICStus;
import se.sics.jasper.SPException;

/**
 *
 * @author gil
 */
public class Prolog {
    
    
       Input input;
       SICStus sp;
    
    public Prolog(String path) throws SPException{
           sp = new SICStus(new String[0], null);
           sp.load(path);
    }
    
    public void nrUtentes() throws SPException, InterruptedException, Exception {
   
        String queryS="conta_Utente"+"("+"X"+").";
  
        HashMap map =new HashMap();

          Query query= sp.openPrologQuery(queryS, map);
          
          while(query.nextSolution()) {
              
              String res = map.toString();
              
             String[] parts= res.split("=");
             
              String parts1[]=parts[1].split("}");
              
          
              System.out.println("Existe "+ parts1[0] + " utentes na base de conhecimento");
          }
        
   
       
            query.close();
    }
    
    public void nrServicos() throws SPException, InterruptedException, Exception {
        
        
        
     String queryS="conta_Servico"+"("+"X"+").";
  
        HashMap map =new HashMap();

          Query query= sp.openPrologQuery(queryS, map);
          
          while(query.nextSolution()) {
              
              String res = map.toString();
              
             String[] parts= res.split("=");
             
              String parts1[]=parts[1].split("}");
              
          
              System.out.println("Existe "+ parts1[0] + " servicos na base de conhecimento");
          }
        
   
       
            query.close();
    }    
        
    public void nrConsultas() throws InterruptedException, SPException, Exception {

            String queryS="conta_Consulta"+"("+"X"+").";
  
            HashMap map =new HashMap();

            Query query= sp.openPrologQuery(queryS, map);
          
          while(query.nextSolution()) {
              
              String res = map.toString();
              
             String[] parts= res.split("=");
             
              String parts1[]=parts[1].split("}");
              
          
              System.out.println("Existe "+ parts1[0] + " consultas na base de conhecimento");
          }
        
   
       
            query.close();  
}


    
    public void informacaoUtente(String nome) throws SPException, InterruptedException, Exception {
    
        String queryS = "utente"+"("+"IdUtente"+","+nome+","+"Idade,Morada"+").";
        
        HashMap map =new HashMap();
       
        Query query = sp.openPrologQuery(queryS, map);
      int flag=0;
          
      while(query.nextSolution()) {
      
          System.out.println(map.toString());
      
          System.out.println("É a solução que pretendia?");
           
          String leitura =input.lerString();
          
          if(leitura.equals("y")) {flag =2;break;}
          else flag =1;
      
      }
      
      if (flag==1) {
          System.out.println("Não existe mais utentes com o nome "+nome);
      }
        
      else {
         if(flag==0) {
          
      
             System.out.println("Não existe utentes com o nome "+nome);
        
         }
      }
        
        
       query.close();
    
    }


    
    public void consultaData(String data) throws SPException, InterruptedException, Exception {
        
      
        String queryS ="consulta("+data+",IdUtente,IdServico,Custo).";
        
         HashMap map =new HashMap();
       
        Query query = sp.openPrologQuery(queryS, map);
        int flag =0;
        
         while(query.nextSolution()) {
      
          System.out.println(map.toString());
      
          System.out.println("É a solução que pretendia?");
           
          String leitura =input.lerString();
          
            if(leitura.equals("y")) {flag =2;break;}
          
                else {flag=1;}
      
      }
      if(flag==1) {
         
      System.out.println("Não existe mais consultas com essa "+data);
      }
        
      else {
      
          if(flag==0) {
      
              System.out.println("Não existe consultas com essa "+data);
      
      
          } 
      }
        
        
      query.close();
    }


    public void procuraServico(String nome) throws SPException, InterruptedException, Exception {
    
    
    String queryS ="servico(IdServico,"+nome+",Instituicao,Cidade).";
        
         HashMap map =new HashMap();
       
        Query query = sp.openPrologQuery(queryS, map);
        int flag =0;
        
         while(query.nextSolution()) {
      
          System.out.println(map.toString());
      
          System.out.println("É a solução que pretendia?");
           
          String leitura =input.lerString();
          
            if(leitura.equals("y")) {flag =2;break;}
          
                else {flag=1;}
      
      }
      if(flag==1) {
         
      System.out.println("Não existe mais sevicos com o nome "+nome);
      }
        
      else {
      
          if(flag==0) {
      
              System.out.println("Não existe sevicos com o nome "+nome);
      
      
          } 
      }
        
        
      query.close();
    
    
    
    
    }
    
  
    
    public void utentePagou(String data,int idU) throws SPException, InterruptedException, Exception {
    
    
     String queryS ="consulta("+data+","+idU+","+"IdServico,Custo).";
        
         HashMap map =new HashMap();
       
        Query query = sp.openPrologQuery(queryS, map);
        int flag =0;
        
         while(query.nextSolution()) {
      
          System.out.println(map.toString());
      
          System.out.println("É a solução que pretendia?");
           
          String leitura =input.lerString();
          
            if(leitura.equals("y")) {flag =2;break;}
          
                else {flag=1;}
      
      }
      if(flag==1) {
         
      System.out.println("Não existe mais consultas na data "+data+ "para o utente " +idU);
      }
        
      else {
      
          if(flag==0) {
      
              System.out.println("Não existe consultas na data"+data+ "para o utente" +idU);
      
      
          } 
      }
        
        
      query.close();

    }
    


    

 public void idUtente(int idU) throws SPException, InterruptedException, Exception {
 
   String queryS ="utente("+idU+",Nome,Idade,Morada).";
        
         HashMap map =new HashMap();
       
        Query query = sp.openPrologQuery(queryS, map);
        int flag =0;
        
         while(query.nextSolution()) {
      
          System.out.println(map.toString());
      
         flag=1;
      
      }
      
      
          if(flag==0) {
      
              System.out.println("Não existe o utente com o id = " +idU);
      
      
          } 
      
        
        
      query.close();
 

 }    

 public void idServico(int idS) throws SPException, InterruptedException, Exception {
 
     
     
   String queryS ="servico("+idS+",Descricao,Instituicao,Cidade).";
        
         HashMap map =new HashMap();
       
        Query query = sp.openPrologQuery(queryS, map);
        int flag =0;
        
         while(query.nextSolution()) {
      
          System.out.println(map.toString());
      
         flag=1;
      
      }
      
      
          if(flag==0) {
      
              System.out.println("Não existe serviços com o esse id = " +idS);
      
      
          } 
       query.close();
     
 }
 
 public void dadaDesconhecida()throws SPException, InterruptedException, Exception {
 
     
  String queryS ="consulta(data_desconhecida,IdUtente,IdServico,"+"Custo"+ ").";
        
         HashMap map =new HashMap();
       
        Query query = sp.openPrologQuery(queryS, map);
        int flag =0;
        
         while(query.nextSolution()) {
      
          System.out.println(map.toString());
      
          System.out.println("É a solução que pretendia?");
           
          String leitura =input.lerString();
          
            if(leitura.equals("y")) {flag =2;break;}
          
                else {flag=1;}
      
      }
      if(flag==1) {
         
      System.out.println("Não existe mais consultas em que a data seja desconhecida ");
      }
        
      else {
      
          if(flag==0) {
      
              System.out.println("É conhecido a data de todas as consultas");
      
      
          } 
      }
        
        
      query.close();
 }
 
 
 
 
 
 
 
 
    
 public void custoDesconhecido() throws SPException, InterruptedException, Exception {
 
     
  String queryS ="consulta(Data,IdUtente,IdServico,"+"custo_desconhecido"+ ").";
        
         HashMap map =new HashMap();
       
        Query query = sp.openPrologQuery(queryS, map);
        int flag =0;
        
         while(query.nextSolution()) {
      
          System.out.println(map.toString());
      
          System.out.println("É a solução que pretendia?");
           
          String leitura =input.lerString();
          
            if(leitura.equals("y")) {flag =2;break;}
          
                else {flag=1;}
      
      }
      if(flag==1) {
         
      System.out.println("Não existe mais consultas sem que o custo seja desconhecido ");
      }
        
      else {
      
          if(flag==0) {
      
              System.out.println("É conhecido o custo de todas as consultas");
      
      
          } 
      }
        
        
      query.close();
 }
 
  public void moradaDesconhecida() throws SPException, InterruptedException, Exception {
 
     
  String queryS ="utente(IdUtente,Nome,Idade,"+"morada_desconhecido"+ ").";
        
         HashMap map =new HashMap();
       
        Query query = sp.openPrologQuery(queryS, map);
        int flag =0;
        
         while(query.nextSolution()) {
      
          System.out.println(map.toString());
      
          System.out.println("É a solução que pretendia?");
           
          String leitura =input.lerString();
          
            if(leitura.equals("y")) {flag =2;break;}
          
                else {flag=1;}
      
      }
      if(flag==1) {
         
      System.out.println("Não existe mais utentes em que a morada seja desconhecida ");
      }
        
      else {
      
          if(flag==0) {
      
              System.out.println("É conhecido todas as moradas dos utentes");
      
      
          } 
      }
        
        
      query.close();
 }
 
 
 
 

 
 
    
    
}