package model;

public class Jugada 
{
    private int indice;
    private int num1,num2,num3,num4;

    public Jugada() 
    {
        this.indice = 0;
        this.num1 = 0;
        this.num2 = 0;
        this.num3 = 0;
        this.num4 = 0;
    }
    public Jugada(int indice,  String numero)
    {
        this.indice = indice;
        
        if(numero.length() == 3)
        {
            num1 = Integer.parseInt("" + numero.charAt(0));
            num2 = Integer.parseInt("" + numero.charAt(1));
            num3 = Integer.parseInt("" + numero.charAt(2));
            num4 = Integer.parseInt("" + numero.charAt(3));
        }
    }
    //<editor-fold desc="GYS:">

    public int getIndice() {
        return indice;
    }

    public void setIndice(int indice) {
        this.indice = indice;
    }

    public int getNum1() {
        return num1;
    }

    public void setNum1(int num1) {
        this.num1 = num1;
    }

    public int getNum2() {
        return num2;
    }

    public void setNum2(int num2) {
        this.num2 = num2;
    }

    public int getNum3() {
        return num3;
    }

    public void setNum3(int num3) {
        this.num3 = num3;
    }

    public int getNum4() {
        return num4;
    }

    public void setNum4(int num4) {
        this.num4 = num4;
    }
    //</editor-fold>

    @Override
    public String toString()
    {
        return "Respuesta{" + "indice=" + indice + ", num1=" + num1 + ", num2=" + num2 + ", num3=" + num3 + ", num4=" + num4 + '}';
    }
    

    
    
    
}
