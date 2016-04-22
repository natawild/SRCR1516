/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package srcr;

/**
 *
 * @author gil
 */
public class Menu {
    
    public Menu(){
        int i=0;
        System.out.println("*****************************************************************");
        System.out.println("***************************SRCR**********************************");
        System.out.println("************************Exercício 2******************************");
        System.out.println("*****************************************************************");
        System.out.println("\n\n");
        String args[]={ ". Número de utentes resgistados.",
                     ". Número de Servicos Registados.",
                     ". Número de consultas.",
                     ". Encontrar informações sobre um utente com um dado nome.",
                     ". Informações sobre um determinado Serviço.",
                     ". Pesquisar consultas por data.",
                     ". Para um data e um id ver os servicos que ele foi e o custo.",
                     ". Dado um id do utente saber quem é esse utente.",
                     ". Dado um id do serviço saber qual é esse servico.",
                     ". Ver as consultas que nao se sabe a data.",
                     ". Ver as consultas que nao se sabe o custo.",
                     ". Ver os utentes em que a morada seja desconhecida.",
                     ". Adicionar utente",
                     ". Adicionar servico",
                     ". Adicionar consulta",
                     ". Remover utente",
                     ". Remover servico",
                     ". Remover consulta",
                     ". Demonstração do utente",
                     ". Demonstração do servico",
                     ". Demonstração da consulta",
                     ". Sair."
        };
        
    while(i<args.length-1) {
        
        System.out.println(i+1+args[i]);
     
        i++;
        
        
    }
      
    System.out.println(0+args[i]);
    System.out.print("\n");
 
    }
    
    
}