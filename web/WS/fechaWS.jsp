<%@page import="java.util.Date"%>
<%@page import="com.google.gson.Gson"%>
<%
    Gson gson = new Gson();
    
    Date fechaSorteo = controller.Controller.getFechaSorteo();
    
    //out.print(fechaSorteo.getDay());
    String strDiaFechaSorteo = "";
    switch(fechaSorteo.getDay())
    {
        case 0: strDiaFechaSorteo = "Lunes"; break;
        case 1: strDiaFechaSorteo = "Martes"; break;
        case 2: strDiaFechaSorteo = "Miercoles"; break;
        case 3: strDiaFechaSorteo = "Jueves"; break;
        case 4: strDiaFechaSorteo = "Viernes"; break;
        case 5: strDiaFechaSorteo = "Sabado"; break;
        case 6: strDiaFechaSorteo = "Domingo"; break;
    }
    String strMesFechaSorteo = "";
    switch(fechaSorteo.getMonth())
    {
        case 0: strMesFechaSorteo = "Enero"; break;
        case 1: strMesFechaSorteo = "Febrero"; break;
        case 2: strMesFechaSorteo = "Marzo"; break;
        case 3: strMesFechaSorteo = "Abril"; break;
        case 4: strMesFechaSorteo = "Mayo"; break;
        case 5: strMesFechaSorteo = "Junio"; break;
        case 6: strMesFechaSorteo = "Julio"; break;
        case 7: strMesFechaSorteo = "Agosto"; break;
        case 8: strMesFechaSorteo = "Setiembre"; break;
        case 9: strMesFechaSorteo = "Octubre"; break;
        case 10: strMesFechaSorteo = "Noviembre"; break;
        case 11: strMesFechaSorteo = "Diciembre"; break;
        default: strMesFechaSorteo = "Diciembre"; break;
    }
    out.print("{\"fechaSorteo\":\"" + strDiaFechaSorteo + " " + fechaSorteo.getDate() + " " + strMesFechaSorteo + " " + (fechaSorteo.getYear() + 1900) + "\", \"tiempoSorteo\":\"" +controller.Controller.getTiempoSorteo() + "\"}");
    
%>