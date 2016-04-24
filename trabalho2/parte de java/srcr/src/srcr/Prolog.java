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
         
      System.out.println("Não existe mais consultas com essa data "+data);
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
         
      System.out.println("Não existe mais consultas na data "+data+ " para o utente " +idU);
      }
        
      else {
      
          if(flag==0) {
      
              System.out.println("Não existe consultas na data "+data+ " para o utente " +idU);
      
      
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
 
 
  public int adicionarUtente(int id,String nome, int idade, String morada) throws SPException, InterruptedException, Exception {
    int flag=0;
  
    if(existeId(id)==1) {
       System.out.println("Já existe o id "+id);
       return 0;
   }   
    
   

  String queryS ="inserirUtente("+id+","+nome+","+idade+","+morada +").";
        
        
   HashMap map =new HashMap();
       
   
   Query query = sp.openPrologQuery(queryS, map);
  
   while(query.nextSolution()) {
   
       
       flag=1;
   
   
   }
      
      if(flag==0) {
      
      System.out.println("Não se pode saber a morada do utente "+nome);
      
      
      }
      
      else {
      System.out.println("Utente inserido com sucesso");
      }
  
  
  query.close();
  return 1;
  }
  
 
  public  int existeId(int id) throws SPException, InterruptedException, Exception {
  
  String queryS ="utente("+id+",Nome,Idade,Morada).";
   int flag=0;     
        
   HashMap map =new HashMap();
       
   
   Query query = sp.openPrologQuery(queryS, map);
  
      while(query.nextSolution()) {
      flag=1;
      
      }
      
      
      
  query.close();
  return flag;
  }
  
  public int adicionarServico(int id,String nome,String instituicao,String cidade) throws SPException, InterruptedException, Exception {
  
  int flag=0;
  
    if(existeIdServico(id)==1) {
       System.out.println("Já existe o id "+id);
       return 0;
   }   
    
   

  String queryS ="inserirServico("+id+","+nome+","+instituicao+","+cidade +").";
        
        
   HashMap map =new HashMap();
       
   
   Query query = sp.openPrologQuery(queryS, map);
  
   while(query.nextSolution()) {
   
       
       flag=1;
   
   
   }
      
        System.out.println("Servico inserido com sucesso");
      
  
  
  query.close();
  return 1;
  }
  
  



public int existeIdServico(int id)throws SPException, InterruptedException, Exception{
    
     String queryS ="servico("+id+ ",Descricao,Instituicao,Cidade).";
   int flag=0;     
        
   HashMap map =new HashMap();
       
   
   Query query = sp.openPrologQuery(queryS, map);
  
      while(query.nextSolution()) {
      flag=1;
      
      }

  query.close();
    
    return flag;
}
   
  
public int existeIdConsulta(String data,int idUtente,int idServico,int custo) throws SPException, InterruptedException, Exception{
    
    int flag=0;
    
     
     String queryS ="consulta("+data+","+idUtente+","+idServico+","+custo +").";
       
        
   HashMap map =new HashMap();
       
   
   Query query = sp.openPrologQuery(queryS, map);
  
      while(query.nextSolution()) {
      flag=1;
      
      }

  query.close();
    
    return flag;
}
    
public int inserirConsulta(String data,int idUtente,int idServico,int custo) throws SPException, InterruptedException, Exception{   
    int flag=0;
    if(existeIdConsulta(data,idUtente,idServico,custo)==1) {
    
    System.out.println("Já existe essa consulta");
    
    return 0;
    }
    
    if(existeId(idUtente)==0) {
    
    System.out.println("Não existe esse utente");
    
    return 0;
    }
    
    if(existeIdServico(idServico)==0) {
    
    System.out.println("Não existe esse servico");
    
    return 0;
    
    }
    
    
    String queryS ="inserirConsulta("+data+","+idUtente+","+idServico+","+custo +").";
    
    HashMap map =new HashMap();
       
    Query query = sp.openPrologQuery(queryS, map);
    
   while(query.nextSolution()) {
   
       
       flag=1;
   
   
   }
      
      if(flag==0) {
      
      System.out.println("Não se pode saber o servido do utente "+idUtente+ "na data "+data);
      
      
      }
      
      else {
      System.out.println("Consulta inserida com sucesso");
      }
  
  
  query.close();
  return 1;
}

 public int removerUtente(int id) throws SPException, InterruptedException, Exception {
 
     int flag=0;

     if(existeId(id)==0) {
     
         System.out.println("O id= "+id + " nao existe ");
        return 0;
     
     }
     
    String queryS ="removerUtente("+id+ ",Nome,Idade,Morada).";
    
    HashMap map =new HashMap();
       
    Query query = sp.openPrologQuery(queryS, map);
    
    
    
   while(query.nextSolution()) {    
       flag=1;
   }
      
      if(flag==0) {
      
      System.out.println("Não se pode remover o utente cujo o id é "+id);
      
      
      }
      
      else {
      System.out.println("Utente removido com sucesso");
      }
  
  
  query.close();
  
  return 1;
 }  


 public int removerServico(int idS)throws SPException, InterruptedException, Exception {
 
        int flag=0;

        if(existeIdServico(idS)==0) {
        
            System.out.println("O id do servico = "+idS+" nao existe");
            
         return 0;
        }
        
        
    String queryS ="removerServico("+idS+ ",Nome,Instituicao,Cidade).";
    
    HashMap map =new HashMap();
       
    Query query = sp.openPrologQuery(queryS, map);
    
   while(query.nextSolution()) {    
       flag=1;
   }
      
      if(flag==0) {
      
      System.out.println("Não se pode remover o servico cujo o id é "+idS);
      
      
      }
      
      else {
      System.out.println("Servico removido com sucesso");
      }
  
  
  query.close();
 return 1;
 }
 
 public int removerConsulta(String data,int idUtente,int idServico,int custo) throws SPException, InterruptedException, Exception{   
    int flag=0;
     
     
    if(existeId(idUtente)==0) {
    
    System.out.println("Não existe esse utente");
    
    return 0;
    }
    
    if(existeIdServico(idServico)==0) {
    
    System.out.println("Não existe esse servico");
    
    return 0;
    
    }
    
    if(existeIdConsulta(data, idUtente, idServico, custo)==0) {
    
    
        System.out.println("A consulta não existe");
    
    return 0;
        
    
    }    
    
     String queryS ="removerConsulta("+data+","+idUtente+","+idServico+","+custo +").";
    
    HashMap map =new HashMap();
       
    Query query = sp.openPrologQuery(queryS, map);
    
   while(query.nextSolution()) {
  
       flag=1;

   
   } 
   
   if(flag==0) {
   
       System.out.println("Impossivel remover esta consulta");
   
   }
   
   else {
     
   System.out.println("Consulta removida com sucesso");
   
   }
   
   
   query.close();
   return 1;
    
   
 }
 
 public void demonstracaoUtente(int id,String nome, int idade, String morada)throws SPException, InterruptedException, Exception{   
     
    
     
     String queryS ="demo(utente("+id+","+nome+","+idade+","+morada+"),Questao).";
    
    HashMap map =new HashMap();
       
    Query query = sp.openPrologQuery(queryS, map);
     
     while(query.nextSolution()) {
     
     System.out.println(map.toString());
     }
         
 }
 
 
  public void demonstracaoServico(int id,String nome, String instituicao, String cidade)throws SPException, InterruptedException, Exception{   
     

     
     String queryS ="demo(servico("+id+","+nome+","+instituicao+","+cidade+"),Questao).";
    
    HashMap map =new HashMap();
       
    Query query = sp.openPrologQuery(queryS, map);
     
     while(query.nextSolution()) {
     
     System.out.println(map.toString());
     }
         
 }
  
  public void demonstracaoConsulta(String data,int idU, int idS, int custo)throws SPException, InterruptedException, Exception{   
     
   
     
     String queryS ="demo(consulta("+data+","+idU+","+idS+","+custo+"),Questao).";
    
    HashMap map =new HashMap();
       
    Query query = sp.openPrologQuery(queryS, map);
     
     while(query.nextSolution()) {
     
     System.out.println(map.toString());
     }
         
 }
  
 
 
 
 
 
 
 
 
 
}