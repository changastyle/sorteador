<html>
    <head>
        <%@include file="head.jsp" %>
        <style>
            #contenedor
            {
                position: absolute;
                top:0px;
                bottom: 0px;
                left:0px;
                right: 0px;
                background-color:#9B3C52;
                /*background-color:#4CAF50;*/
                height: 100%;
                /*border:solid 2px black;*/
                width: 100%;
                
            }
            #logoSalta
            {
                max-height: 80px;
                margin:4px;
            }
            .listas
            {
                /*border:solid 2px black;*/
            }
            .numero
            {
                font-size: 56px;
                /*text-align: center;*/
                display: inline-block;
                font-family: 'Orbitron', sans-serif;
                width: 75%
            }
            .digito
            {
                margin: 0px;
                display: inline-block;
                padding:0px;
                font-size: 56px;
            }
            .indice
            {
                font-size: 48px;
                display: inline-block;
                font-family: 'Orbitron', sans-serif;
                background-color:black;
                color:white;
                width: 25%;
                margin-right: 15px;
                text-align: center;
            }
        </style>
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    </head>
    <body ng-app="app" ng-controller="monitor">
        <div id="contenedor">
            <div class="banner hx">
                <h4><img id="logoSalta" src="res/img/loteria.jpg" class="img-responsive img-thumbnail" > Loteria de Salta!</h4>
                <h5>Operada por TecnoAccion</h5>
            </div>
            
            <div class="container-fluid">
                <div class="col-xs-3 listas" id="lista1"> 
                    <table class="table">
                        <tr ng-repeat="c in estructura1">
                            <td class="indice">{{c.indice}}</td>
                            <td class="numero">
                                <div class="col-xs-3 digito numero1">{{c.numero1}}</div>
                                <div class="col-xs-3 digito numero2">{{c.numero2}}</div>
                                <div class="col-xs-3 digito numero3">{{c.numero3}}</div>
                                <div class="col-xs-3 digito numero3">{{c.numero4}}</div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="col-xs-3 listas" id="lista2">
                    <table class="table">
                        <tr ng-repeat="c in estructura2">
                            <td class="indice">{{c.indice}}</td>
                            <td class="numero">
                                <div class="col-xs-3 digito numero1">{{c.numero1}}</div>
                                <div class="col-xs-3 digito numero2">{{c.numero2}}</div>
                                <div class="col-xs-3 digito numero3">{{c.numero3}}</div>
                                <div class="col-xs-3 digito numero3">{{c.numero4}}</div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="col-xs-3 listas" id="lista3">
                    <table class="table">
                        <tr ng-repeat="c in estructura3">
                            <td class="indice">{{c.indice}}</td>
                            <td class="numero">
                                <div class="col-xs-3 digito numero1">{{c.numero1}}</div>
                                <div class="col-xs-3 digito numero2">{{c.numero2}}</div>
                                <div class="col-xs-3 digito numero3">{{c.numero3}}</div>
                                <div class="col-xs-3 digito numero3">{{c.numero4}}</div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="col-xs-3 listas" id="lista4">                
                </div>
            </div>
        </div>
    </body>
    <script>
        app = angular.module('app', []);
        
        
        app.controller('monitor', function($scope, $http)
        {
            $scope.estructura1 = new Array();
            $scope.estructura2 = new Array();
            $scope.estructura3 = new Array();
            $scope.estructura4 = new Array();
        
            for (i = 1 ; i <= 5 ; i++)
            {
                /*numero1 = Math.round(Math.random() * 9999).toString();
                numero2 = Math.round(Math.random() * 9999).toString();
                numero3= Math.round(Math.random() * 9999).toString();
                numero4= Math.round(Math.random() * 9999).toString();*/
            
                numero1 = "    ";
                numero2 = "    ";
                numero3 = "    ";
                numero4 = "    ";
                
                $scope.estructura1.push({"indice":i,"numero1": numero1.charAt(0),"numero2": numero1.charAt(1),"numero3": numero1.charAt(2),"numero4": numero1.charAt(3)});
                $scope.estructura2.push({"indice":(i + 5),"numero1": numero2.charAt(0),"numero2": numero2.charAt(1),"numero3": numero2.charAt(2),"numero4": numero2.charAt(3)});
                $scope.estructura3.push({"indice":(i + 10),"numero1": numero3.charAt(0),"numero2": numero3.charAt(1),"numero3": numero3.charAt(2),"numero4": numero3.charAt(3)});
                $scope.estructura4.push({"indice":(i + 15),"numero1": numero4.charAt(0),"numero2": numero4.charAt(1),"numero3": numero4.charAt(2),"numero4": numero4.charAt(3)});
            }
        
            /*
             * $.ajax({url: "http://localhost:8080/muyBonito/WS/reciboJugada.jsp",success: function (result, textStatus, jqXHR)
            {
                //console.log($scope.columna);
                $scope.columna = result;
                console.log($scope.columna);
            }});
            */
        });
    </script>
</html>