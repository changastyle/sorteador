<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Principal</title>
        <%@include file="head.jsp"%>
        <link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
        <style>
            body
            {
               
            }
            .wrap2
            {
                
                background-color:rgba(0,0,0,0.85);
                padding-bottom: 80px;
                overflow: hidden;
            }
            .ambos
            {
                
                height: auto;
                cursor:pointer;
                background-color: #455A64;
                /*margin-bottom: 25px;
                margin-top: 25px;*/
                border-radius: 5px;
                box-shadow: 15px 15px 15px black;
                transition: 1s;
            }
            .ambos:hover
            {
                background-color:#4CAF50;
                transform:scale(1.25);
                transition: 1s;
                border-radius: 40px;
                box-shadow: 30px 30px 30px black;
            }
            .head
            {
                transition: 1s;
                border-radius: 150px;
            }
            .headRot
            {
                transform: rotate(360deg);
                transition: 1s;
                /*border-radius: 150px;*/
                
            }
            
            .headerWrap2
            {
                text-align: center;
                font-family: 'Lobster', cursive;
                font-size: 36px;
                color:white;
                
            }
        </style>
    </head>
    <body>
        <div class="col-xs-10 col-xs-offset-1 hx" style="margin-bottom: 0px;">
           Loteria de Salta!
        </div>
        <div class="col-xs-10 col-xs-offset-1 wrap2 ">
            <h4 class="col-xs-12 headerWrap2" style="margin-top:25px;margin-bottom:50px">Seleccioná una funcion!</h4>
            <div class="col-xs-4 col-xs-offset-1 izq ambos" onclick="abrir('monitor.jsp')" onmouseover="encima(this)" data-head="headMonitor" onmouseout="afuera(this)">
                <img class="img-thumbnail img-responsive center-block" src="res/img/monitor.png" style="max-height: 250px;margin-top:12px;">
                <h3 class="hx head" id="headMonitor">Monitor</h3>
            </div>
            <div class="col-xs-4 col-xs-offset-1 der ambos" onclick="abrir('cargarJugadas.jsp')" onmouseover="encima(this)" data-head="headJugadas" onmouseout="afuera(this)">
                <img class="img-thumbnail img-responsive center-block" src="res/img/notepad.png" style="max-height: 250px;margin-top:12px;">
                <h3 class="hx head" id="headJugadas">Cargar Jugadas</h3>
            </div>
            
        </div>
        <div class="col-xs-10 col-xs-offset-1 hx" style="margin-bottom: 0px;">
           Desarrollado por TecnoAccion S.A
        </div>
            
        <!--<h4 class="hx">Seleccioná una funcion!</h4>-->
            
        
    </body>
    <script>
        function abrir(url)
        {
            window.location.href = url;
        }
        function encima(quien)
        {
            head = $(quien).data("head");
            
            $("#" + head).addClass("headRot");
        }
        function afuera(quien)
        {
            head = $(quien).data("head");
            
            $("#" + head).removeClass("headRot");
        }
    </script>
</html>
