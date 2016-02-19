package controller;

import model.Jugada;

public class Controller 
{
    public static int estado;
    public static java.util.ArrayList<model.Jugada> arr = new java.util.ArrayList<model.Jugada>();
 
    public static void addJugada(Jugada jugadaRecibida)
    {
        arr.add(jugadaRecibida);
        estado =  arr.size() ;
    }
    public static void resetearArr()
    {
        arr = null;
        arr = new java.util.ArrayList<model.Jugada>();
    }
}
