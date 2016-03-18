<%@page import="java.util.Date"%>
<%
    String strFechaSorteo = request.getParameter("fechaSorteo");
    String strTiempoSorteo = request.getParameter("tiempoSorteo");
    
    out.print(strFechaSorteo);
    
    int anio = (Integer.parseInt(strFechaSorteo.substring(0 , 4)) - 1900);
    int mes = (Integer.parseInt(strFechaSorteo.substring(5, 7)) - 1);
    int dia = Integer.parseInt(strFechaSorteo.substring(8 , 10));
    
    Date fecha = new Date(anio,  mes, dia);
    //out.print(fecha);
    
    controller.Controller.setFechaSorteo(fecha);
    controller.Controller.setTiempoSorteo(strTiempoSorteo);
    
    controller.Controller.resetearArr();
%>