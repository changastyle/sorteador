package model;

public class Jugada 
{
    private int indice;
    private String numero;

    public Jugada() 
    {
        this.indice = 0;
        this.numero = "";
    }
    public Jugada(int indice, String numero)
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

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }
    
    //</editor-fold>

    @Override
    public String toString() 
    {
        return "{" + indice +" , " + numero + "}";
    }  
}
