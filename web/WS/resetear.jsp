<%@page import="java.util.Date"%>
<%
    String strFechaSorteo = request.getParameter("fechaSorteo");
    String strTiempoSorteo = request.getParameter("tiempoSorteo");
    
    controller.Controller.setFechaSorteo(new Date(strFechaSorteo));
    controller.Controller.setTiempoSorteo(strTiempoSorteo);
    
    controller.Controller.resetearArr();
%>