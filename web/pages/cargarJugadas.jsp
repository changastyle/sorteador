<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp"%>
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
        <title>Cargar Jugadas</title>
        <style>
            label
            {
                text-align: center;
            }
            table
            {
                text-align: center;
            }
            th
            {
                text-align: center;
            }
            .img-wait
            {
                display: none;
                max-height: 35px;
                color:green;
            }
            .wrap2
            {
                background-color:rgba(0,0,0,0.85);
                padding-bottom: 80px;
                color:white;
            }
        </style> 
    </head>
    <body ng-app="app"  ng-controller="cargarJugadas">
       
        <!-- Banner -->
        <div class="col-xs-10 col-xs-offset-1 hx" style="margin-bottom: 0px;">
           Loteria de Salta!
        </div>
       
        <!-- Formulario -->
        <div class="col-xs-10 col-xs-offset-1 wrap2">
            <div class="form-horizontal" style=" border-radius: 5px; padding:12px;">
                <h3 class="hs" style="font-size: 24px;">Formulario carga de jugadas:</h3>
                
                <div class="alert alert-danger" hidden>
                    <strong>Danger!</strong> Indicates a dangerous or potentially negative action.
                </div>
                
                <button style="display: none;" class="btn btn-default" onclick="window.location.href='home.jsp'"
                        <span class="glyphicon glyphicon-arrow-left"></span> Home
                </button>
                
                
                <div class="form-group">
                    <label class="col-xs-2">Fecha:</label>
                    <div class="col-xs-10">
                        <input id="datePicker" type="date" name="fecha" class="form-control" autofocus>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-xs-2">Sorteo:</label>
                    <div class="col-xs-10">
                        <select name="sorteo" id="comboSorteo" class="form-control">
                            <option>Matutina</option>
                            <option>Vespertina</option>
                            <option>Nocturno</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-group">
                    <button class="btn btn-success form-control" id="btnComenzar" ng-click="mostrarListado()" >
                        <span class="glyphicon glyphicon-ok"></span> Comenzar!
                    </button>
                </div>
                
                <!-- Listado de carga: -->
                <div class="form-group" id="listadoCarga" hidden>
                    <table class="table table-responsive">
                        <thead>
                        <th class="col-xs-5">Jugadas</th>
                        <th class="col-xs-1"></th>
                        <th class="col-xs-5">Jugadas</th>
                        <th class="col-xs-1"></th>
                        </thead>
                        <tbody>
                            <tr ng-repeat="r in repeticiones">
                                <td class="col-xs-5">
                                    <div class="input-group">
                                        <span class="input-group-addon" id="basic-addon1">{{r.indice1}}</span>
                                        <input type="text" id="inputJugada{{r.indice1}}" data-identificador="{{r.indice1}}" placeholder="Cargar {{r.texto1}} Jugada acá.."
                                               class="form-control inputsJugadas" aria-describedby="basic-addon1"
                                               onkeypress="validarInputJugada(this)" onkeyup="validarInputJugada(this)">
                                    </div>
                                    <td class="col-xs-1">
                                        <button id="btnJugadas1" data-identificador="{{r.indice1}}" onclick="enviarJugadaSimple(this)" class="btn btn-success">
                                            <span class="glyphicon glyphicon-ok"></span> Enviar
                                        </button>
                                        <img id="progress{{r.indice1}}" class="img-thumbnail img-wait" height="10px" src="res/img/progress.gif" >
                                        <h5  id="okay{{r.indice1}}" class="img-wait"><span class="glyphicon glyphicon-ok" height="10px" ></span> Enviado</h5>
                                    </td>
                                </td>
                                <td class="col-xs-5">
                                    <div class="input-group">
                                        <span class="input-group-addon" id="basic-addon1">{{r.indice2}}</span>
                                        <input type="text" id="inputJugada{{r.indice2}}"  data-identificador="{{r.indice2}}" placeholder="Cargar {{r.texto2}} Jugada acá.." 
                                               class="form-control inputsJugadas" aria-describedby="basic-addon1"
                                               onkeypress="validarInputJugada(this)" onkeyup="validarInputJugada(this)" >
                                    </div>
                                </td>
                                <td class="col-xs-1">
                                    <button  id="btnJugadas{{r.indice2}}" data-identificador="{{r.indice2}}" class="btn btn-success" onclick="enviarJugadaSimple(this)">
                                        <span class="glyphicon glyphicon-ok"></span> Enviar
                                    </button>
                                    <img id="progress{{r.indice2}}" class="img-thumbnail img-wait" height="10px" src="res/img/progress.gif" >
                                    <h5  id="okay{{r.indice2}}" class="img-wait" ><span class="glyphicon glyphicon-ok" height="10px" ></span> Enviado</h5>
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
            $("#btnComenzar").hide("slow");
            $("#listadoCarga").show("slow");
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
            document.getElementById("comboSorteo").selectedIndex = "0";
        }
        else if(fechaActual.getHours() > 12 && fechaActual.getHours()< 18)
        {
            document.getElementById("comboSorteo").selectedIndex = "1";
        }
        else
        {
            document.getElementById("comboSorteo").selectedIndex = "2";
        }
        
        //RESETEAR ARR BACKEND:
        $.ajax({url:"../WS/resetear.jsp",success: function (data, textStatus, jqXHR) 
        {
            console.log("arr backend reseteado!")
        }});
    });

    function validarInputJugada(quien)
    {
        id = $(quien).data("identificador");
        valor = $(quien).val();
        botonAsociado = "btnJugadas" + id ;
        
        console.log("validando inputs jugada: valor-> " + valor + " | botonAsociado ->" + botonAsociado) ;


        if(isNaN(valor) || valor.length != 4 )
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

        $(quien).hide();
        jugada = {"indice" : id, "numero" : valorDelInput};
        console.log("jugada" + jugada.toString());
        $.ajax(
        {   url:"../WS/reciboJugada.jsp",
            data:{"jugada": JSON.stringify(jugada)},
            beforeSend: function (xhr) 
            {
                $("#" + progress).show();
            },success: function (response, textStatus, jqXHR) 
            {
                $("#" + input).prop("disabled",true);
                $("#" + progress).hide(); 
                $("#" + okay).show();
                console.log("respuesta del WS: " + response);
            }
        });
        
    }
    </script>
</html>
