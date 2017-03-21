/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author LORENA
 */
public class Casilla {
    
    private int valor;
    private String color;
    
    public void setValor(int valor){
        this.valor = valor;
    }
    
    public int getValor(){
        return valor;
    }
    
    public String getColor(){
        return color;
    }
    
    public void setColor(String color){
        this.color =  color;
    }
    
    public void incrementValor(){
        valor = valor+1;
    }
    
    public void resetValor(){
        valor = 0;
    }
}
