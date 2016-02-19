package model;

public class Jugada 
{
    private int indice;
    private int numero;

    public Jugada() 
    {
        this.indice = 0;
        this.numero = 0;
    }
    public Jugada(int indice, int numero)
    {
        this.indice = indice;
        this.numero = numero;
    }
    //<editor-fold desc="GYS:">

    public int getIndice() {
        return indice;
    }

    public void setIndice(int indice) {
        this.indice = indice;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }
    
    //</editor-fold>

    @Override
    public String toString() 
    {
        return "{" + indice +" , " + numero + "}";
    }  
}
