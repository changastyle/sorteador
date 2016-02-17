<%@page import="com.google.gson.Gson"%>
<%@page import="model.Jugada"%>
<%
    /*out.print(request.getParameter("jugada"));*/
    
    java.util.ArrayList<model.Jugada> arr = new java.util.ArrayList<model.Jugada>();
    
    arr.add(new Jugada(1, "2324"));
    arr.add(new Jugada(2, "2427"));
    arr.add(new Jugada(3, "2528"));
    arr.add(new Jugada(4, "2629"));
    arr.add(new Jugada(5, "2721"));
    

    Gson gson = new Gson();
    out.print(gson.toJson(arr));
%>