<%@page import="com.google.gson.Gson"%>
<%
    Gson gson = new Gson();
    out.print(gson.toJson(controller.Controller.arr));
%>