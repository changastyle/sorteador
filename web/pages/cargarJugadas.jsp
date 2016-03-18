<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp"%>
        <title>Cargar Jugadas</title>
        <link rel="stylesheet" href="res/css/cargarJugadasCSS.css">
        <link rel="stylesheet" href="res/css/enComunCSS.css">
    </head>
    <body ng-app="app"  ng-controller="cargarJugadas">
       
        <!-- Banner -->
        <div class="col-xs-10 col-xs-offset-1 hx" style="margin-bottom: 0px;font-family: 'Arial'">
           Loteria de Salta!
        </div>
       
        <!-- Formulario -->
        <div class="col-xs-10 col-xs-offset-1 wrap2">
            <div class="form-horizontal" style=" border-radius: 5px; padding:12px;">
                <h3 class=" hs headerCargaJugadas">Fecha y Hora del Sorteo:</h3>

                <div class="form-group">
                    <label class="col-xs-2">Fecha:</label>
                    <div class="col-xs-10">
                        <input id="datePicker" type="date" name="fecha" class="form-control" autofocus data-toggle="tooltip" title="Seleccionar Fecha"> 
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-xs-2">Sorteo:</label>
                    <div class="col-xs-10">
                        <select id="comboTiempoSorteo" name="sorteo" class="form-control" data-toggle="tooltip" title="Seleccionar Horario">
                            <option>Matutina</option>
                            <option>Vespertina</option>
                            <option>Nocturno</option>
                        </select>
                    </div>
                </div>
                
                <!-- BTN COMENZAR: -->
                <div class="form-group">
                    <button class="btn btn-success form-control" id="btnComenzar" ng-click="mostrarListado()"  data-toggle="tooltip" title="Inicializa el sorteo">
                        <span class="glyphicon glyphicon-ok"></span> Comenzar!
                    </button>
                </div>
                <!-- BTN RESETEAR: -->
                <div class="form-group">
                    <button class="btn btn-warning form-control" id="btnResetear"  ng-click="resetearSorteo()" ng-show="jugando" data-toggle="tooltip" title="Resetea el sorteo">
                        <span class="glyphicon glyphicon-refresh"></span> Resetear Sorteo!
                    </button>
                </div>
                
                <!-- Listado de carga: -->
                <div class="form-group" id="listadoCarga" ng-show="jugando">
                    <table class="table table-responsive">
                        
                        <thead style="color:black;">
                            <th class="col-xs-12 headerCargaJugadas" colspan="4"> Carga de Jugadas:</th>
                        </thead>
                        <tbody>
                            <tr ng-repeat="r in repeticiones">
                                <td class="col-xs-5">
                                    <div class="input-group">
                                        <span class="input-group-addon" id="basic-addon1">{{r.indice1}}</span>
                                        <input type="text" id="inputJugada{{r.indice1}}" data-identificador="{{r.indice1}}" placeholder="Cargar {{r.texto1}} Jugada acá.."
                                               class="form-control inputsJugadas" aria-describedby="basic-addon1"
                                               onkeypress="validarInputJugada(this)" onkeyup="validarInputJugada(this)" onfocus="limpiarInput(this)">
                                    </div>
                                    <td class="col-xs-1">
                                        <button id="btnJugadas{{r.indice1}}" data-identificador="{{r.indice1}}" onclick="enviarJugadaSimple(this)" class="btn btn-primary">
                                            <span class="glyphicon glyphicon-ok"></span> Enviar
                                        </button>
                                        <img id="progress{{r.indice1}}" class="img-thumbnail img-wait" height="10px" src="res/img/progress.gif" >
                                        <!--<h5 id="okay{{r.indice1}}" class="img-wait"><span class="glyphicon glyphicon-ok" height="10px"></span> Enviado</h5>-->
                                    </td>
                                </td>
                                
                                <!-- SEGUNDA COL -->
                                
                                <td class="col-xs-5">
                                    <div class="input-group">
                                        <span class="input-group-addon" id="basic-addon1">{{r.indice2}}</span>
                                        <input type="text" id="inputJugada{{r.indice2}}"  data-identificador="{{r.indice2}}" placeholder="Cargar {{r.texto2}} Jugada acá.." 
                                               class="form-control inputsJugadas" aria-describedby="basic-addon1"
                                               onkeypress="validarInputJugada(this)" onkeyup="validarInputJugada(this)" onfocus="limpiarInput(this)">
                                    </div>
                                </td>
                                <td class="col-xs-1">
                                    <button  id="btnJugadas{{r.indice2}}" data-identificador="{{r.indice2}}" class="btn btn-primary" onclick="enviarJugadaSimple(this)">
                                        <span class="glyphicon glyphicon-ok"></span> Enviar
                                    </button>
                                    <img id="progress{{r.indice2}}" class="img-thumbnail img-wait" height="10px" src="res/img/progress.gif" >
                                    <!--<h5  id="okay{{r.indice2}}" class="img-wait" ><span class="glyphicon glyphicon-ok" height="10px" ></span> Enviado</h5>-->
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
       
    </body>
    <script>
    app = angular.module('app', []);
    
    app.controller('cargarJugadas', function($scope, $http) 
    {
        $scope.jugando = false;
        $scope.repeticiones = new Array(
        {"indice1":1,"indice2":11,"texto1":"Primera","texto2":"Decimo Primera"},
        {"indice1":2,"indice2":12,"texto1":"Segunda","texto2":"Decimo Segunda"},
        {"indice1":3,"indice2":13,"texto1":"Tercera","texto2":"Decimo Tercera"},
        {"indice1":4,"indice2":14,"texto1":"Cuarta","texto2":"Decimo Cuarta"},
        {"indice1":5,"indice2":15,"texto1":"Quinta","texto2":"Decimo Quinta"},
        {"indice1":6,"indice2":16,"texto1":"Sexta","texto2":"Decimo Sexta"},
        {"indice1":7,"indice2":17,"texto1":"Septima","texto2":"Decimo Septima"},
        {"indice1":8,"indice2":18,"texto1":"Octava","texto2":"Decimo Octava"},
        {"indice1":9,"indice2":19,"texto1":"Novena","texto2":"Decimo Novena"},
        {"indice1":10,"indice2":20,"texto1":"Decima","texto2":"Duodecima"});
        
        $scope.mostrarListado = function()
        {
            //RESETEAR ARR BACKEND:
            fechaSorteo = $("#datePicker").val();
            //fechaSorteo = Date(fechaSorteo);
            tiempoSorteo = $("#comboTiempoSorteo").val();
            console.log("enviando " + fechaSorteo + " " + tiempoSorteo);
            $.ajax({url:"../WS/resetear.jsp", data:{"fechaSorteo":fechaSorteo,"tiempoSorteo":tiempoSorteo},beforeSend: function (xhr) 
            {
                $("#btnComenzar").addClass("btnRotador");
                
            },success: function (data, textStatus, jqXHR) 
            {
                console.log("arr backend reseteado!");
                
                $("#btnComenzar").hide("slow",function()
                {
                    $scope.jugando = true;
                    $scope.$apply();
                });
                /*$("#btnResetear").show("slow");
                $("#listadoCarga").show("slow");*/
            }});
        }
        $scope.resetearSorteo = function()
        {
            if(confirm("Esta seguro de resetear el sorteo??"))
            {
                $.ajax({url:"../WS/resetear.jsp", data:{"fechaSorteo":fechaSorteo,"tiempoSorteo":tiempoSorteo},beforeSend: function (xhr) 
                {
                    $("#btnResetear").addClass("btnRotador");

                },success: function (data, textStatus, jqXHR) 
                {
                    console.log("arr backend reseteado!");

                    location.reload();
                    /*$("#btnResetear").show("slow");
                    $("#listadoCarga").show("slow");*/
                }});
            }
            
           
            
            
            
        }
    });
    </script>
    <script>
    $(document).ready(function()
    {
        fechaActual = new Date();
        console.log(fechaActual.getHours());
        document.getElementById('datePicker').valueAsDate = new Date();

        if(fechaActual.getHours() < 12)
        {
            document.getElementById("comboTiempoSorteo").selectedIndex = "0";
        }
        else if(fechaActual.getHours() > 12 && fechaActual.getHours()< 18)
        {
            document.getElementById("comboTiempoSorteo").selectedIndex = "1";
        }
        else
        {
            document.getElementById("comboTiempoSorteo").selectedIndex = "2";
        }
    });
    
    function validarInputJugada(quien)
    {
        id = $(quien).data("identificador");
        valor = $(quien).val();
        progress = "progress" + id;
        okay = "okay" + id;
        botonAsociado = "btnJugadas" + id ;
        
        console.log("validando inputs jugada: valor-> " + valor + " | botonAsociado ->" + botonAsociado) ;


        //console.log( "botonAsociado:" + $("#" + botonAsociado).css('display')  );none
        if($("#" + botonAsociado).css('display') == "none")
        {
            $("#" + okay ).hide();
            $("#" + progress ).hide();
            $("#" + botonAsociado).show();
            
        }
        console.log("valor:"+ valor.trim())
        if(isNaN(valor) || valor.length != 4  || valor.trim() == "")
        {
            $(quien).css("border","solid 2px red");
            $("#" + botonAsociado).prop( "disabled", true );
        }
        else
        {
            $(quien).css("border","solid 2px green");
            $("#" + botonAsociado).prop( "disabled", false );
        }

    }
    function enviarJugadaSimple(quien)
    {
        id = $(quien).data("identificador");
        input = "inputJugada" +  id;
        progress = "progress" + id;
        okay = "okay" + id;
        valorDelInput = $("#" + input).val();
        
        console.log("Enviando jugada:" + valorDelInput + " | " + progress + " | "  + okay);
        
        jugada = {"indice" : id, "numero" : valorDelInput};
        
        //console.log("jugada" + jugada.toString());
        $.ajax(
        {   
            url:"../WS/reciboJugada.jsp",
            data:{"jugada": JSON.stringify(jugada)},
            beforeSend: function (xhr) 
            {
                $(quien).removeClass("btn-primary");
                
            },success: function (response, textStatus, jqXHR) 
            {
                $(quien).html("<span class='glyphicon glyphicon-ok'></span> Enviado..");
                
                $(quien).addClass("btn-success");
                
                console.log("respuesta del WS: " + response);
            }
        });
        
    }
    function limpiarInput(quien)
    {
        $(quien).val("");
        id = $(quien).data("identificador");
        botonAsociado = "btnJugadas" + id ;
        progress = "progress" + id;
        //okay = "okay" + id;
        
        console.log("limpiando.." + JSON.stringify($(botonAsociado)));
        
        $("#" + botonAsociado).prop( "disabled", true );
        $("#" + botonAsociado).removeClass("btn-success");
        $("#" + botonAsociado).addClass("btn-primary");
        $("#" + botonAsociado).html("<span class='glyphicon glyphicon-ok'></span> Enviar");
        
        //$(botonAsociado).css("border","solid 2px red");
    }
    </script>
</html>
