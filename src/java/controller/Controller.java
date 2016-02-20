package controller;

import java.util.ArrayList;
import java.util.Date;
import model.Jugada;

public class Controller 
{
    public static int estado;
    private static Date fechaSorteo;
    private static String tiempoSorteo;
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
    
    //<editor-fold desc="GYS:">
    
    //</editor-fold>

    public static int getEstado() {
        return estado;
    }

    public static void setEstado(int estado) {
        Controller.estado = estado;
    }

    public static Date getFechaSorteo() {
        return fechaSorteo;
    }

    public static void setFechaSorteo(Date fechaSorteo) {
        Controller.fechaSorteo = fechaSorteo;
    }

    public static String getTiempoSorteo() {
        return tiempoSorteo;
    }

    public static void setTiempoSorteo(String tiempoSorteo) {
        Controller.tiempoSorteo = tiempoSorteo;
    }

    public static ArrayList<Jugada> getArr() {
        return arr;
    }

    public static void setArr(ArrayList<Jugada> arr) {
        Controller.arr = arr;
    }
}
