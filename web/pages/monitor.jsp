<html>
    <head>
        <%@include file="head.jsp" %>
        <link rel="stylesheet" href="res/css/monitorCSS.css">
        <link rel="stylesheet" href="res/css/enComunCSS.css">
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    </head>
    <body ng-app="app" ng-controller="monitor">
        
        <!-- CONTENEDOR PRINCIPAL -->
        <div id="contenedor" style="box-sizing: border-box;"> 
            
            <!-- BANNER : -->
            <div class="banner" style="height: 150px;">
                <div class="titular">
                    <img id="logoSalta" src="res/img/loteria.jpg" class="img-responsive img-thumbnail " >
                    <table style="display:inline-block">
                        <tr><td><h4 class="hl" id="encabezadoPrincipal"> Loteria de Salta!</h4></td></tr>
                        <tr><td><h5 class="hs"> Operada por TecnoAccion </h5></td></tr>
                    </table>
                </div>
                
            </div>
            
            <!-- LISTAS: -->
            <div class="container-fluid" style="box-sizing: border-box; margin-top: 12px;">
                
                <h4 class=" col-xs-12 headerSorteo ">Sorteo del dia {{dia}}: </h4>
                
                <div class="col-xs-3 listas" id="lista1" ng-repeat="p in partes"> 
                    <table class="table" style="height: calc(100% - 250px);">
                        <tr ng-repeat="c in p.estructura">
                            <!--{{p}}-->
                            <td class="indice">{{c.indice}}</td>
                            <td class="numero" id="numero{{c.indice}}" class="vert-align"  valign="middle">
                                <div class="col-xs-3 digito digito1" >{{c.numero1}}</div>
                                <div class="col-xs-3 digito digito2" >{{c.numero2}}</div>
                                <div class="col-xs-3 digito digito3" >{{c.numero3}}</div>
                                <div class="col-xs-3 digito digito4" >{{c.numero4}}</div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            
        </div>
    </body>
    <script>
        app = angular.module('app', []);
        
        app.controller('monitor', function($scope, $http, $interval)
        {
            $scope.arrViejo = new Array();
            $scope.registros =  new Array();
            $scope.partes = new Array({'indice':1 ,'estructura':new Array()},{'indice':2 ,'estructura':new Array()},{'indice':3 ,'estructura':new Array()},{'indice':4 ,'estructura':new Array()});
            /*$scope.partes.estructura1 = new Array();
            $scope.partes.estructura2 = new Array();
            $scope.partes.estructura3 = new Array();
            $scope.partes.estructura4 = new Array();*/
            
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
                
                $scope.partes[0].estructura.push({"indice":i,"numero1": numero1.charAt(0),"numero2": numero1.charAt(1),"numero3": numero1.charAt(2),"numero4": numero1.charAt(3)});
                $scope.partes[1].estructura.push({"indice":(i + 5),"numero1": numero2.charAt(0),"numero2": numero2.charAt(1),"numero3": numero2.charAt(2),"numero4": numero2.charAt(3)});
                $scope.partes[2].estructura.push({"indice":(i + 10),"numero1": numero3.charAt(0),"numero2": numero3.charAt(1),"numero3": numero3.charAt(2),"numero4": numero3.charAt(3)});
                $scope.partes[3].estructura.push({"indice":(i + 15),"numero1": numero4.charAt(0),"numero2": numero4.charAt(1),"numero3": numero4.charAt(2),"numero4": numero4.charAt(3)});
            }
            $interval( function()
            {
                //console.log("bucleo");
                $.ajax(
                {
                    url: "../WS/estado.jsp",
                    beforeSend: function (xhr) 
                    {
                        //console.log("consultando jugadas..");
                    },success: function (resultado, textStatus, jqXHR) 
                    {
                        arr = JSON.parse(resultado); 

                        console.log("resultado: " + arr.length +" jugadas recibidas..");

                        //COMPARO ARRAY VIEJO CON EL ARRAY NUEVO:
                        if(JSON.stringify(arr) != JSON.stringify($scope.arrViejo))
                        {
                            console.log("arrViejo != arrNuevo : " + JSON.stringify(arr) != JSON.stringify($scope.arrViejo));
                            for(i = 0 ; i < arr.length ; i++)
                            {
                                jugada = arr[i];
                                indice = parseInt(jugada.indice);
                                if(indice <= 5)
                                {
                                    $scope.partes[0].estructura[(indice-1)] = {"indice":indice,"numero1": jugada.numero.toString().charAt(0),"numero2": jugada.numero.toString().charAt(1),"numero3": jugada.numero.toString().charAt(2),"numero4": jugada.numero.toString().charAt(3)};
                                    //console.log(jugada.numero + " | " + jugada.numero.toString().charAt(0) + " | "+  jugada.numero.toString().charAt(1) +" | "+ jugada.numero.toString().charAt(2) + " | "+  jugada.numero.toString().charAt(3) );
                                    //console.log($scope.estructura1[i]);
                                    $scope.$apply();
                                }
                                else if(indice > 5 && indice < 10)
                                {
                                    $scope.partes[1].estructura[(indice-6)] = {"indice":indice,"numero1": jugada.numero.toString().charAt(0),"numero2": jugada.numero.toString().charAt(1),"numero3": jugada.numero.toString().charAt(2),"numero4": jugada.numero.toString().charAt(3)};
                                    $scope.$apply();
                                }
                                else if(indice > 10 && indice < 15)
                                {
                                    $scope.partes[2].estructura[(indice-11)] = {"indice":indice,"numero1": jugada.numero.toString().charAt(0),"numero2": jugada.numero.toString().charAt(1),"numero3": jugada.numero.toString().charAt(2),"numero4": jugada.numero.toString().charAt(3)};
                                    $scope.$apply();
                                }
                                else if(indice > 15 && indice < 20)
                                {
                                    $scope.partes[3].estructura[(indice-16)] = {"indice":indice,"numero1": jugada.numero.toString().charAt(0),"numero2": jugada.numero.toString().charAt(1),"numero3": jugada.numero.toString().charAt(2),"numero4": jugada.numero.toString().charAt(3)};
                                    $scope.$apply();
                                }
                                
                                //HAGO GIRAR LAS QUE CAMBIARON:
                                if(JSON.stringify($scope.arrViejo[i]) != JSON.stringify(arr[i]))
                                {
                                    console.log("viejo :" + JSON.stringify($scope.arrViejo[i]) + " | nuevo:" + JSON.stringify(arr[i]) );
                                    $scope.girar( parseInt(arr[i].indice) - 1 );
                                }  
                            }
                            $scope.arrViejo = arr;
                        }
                    }
                ,async: true
                });

            }, 250);
            
            $scope.girar = function(indice)
            {
                indice = (indice + 1);
                console.log("girando.. " + indice );
                //console.log( $("#numero"+indice).children(".digito1").html() );
                valorInicial1 = $("#numero"+indice).children(".digito1").html();
                valorInicial2 = $("#numero"+indice).children(".digito2").html();
                valorInicial3 = $("#numero"+indice).children(".digito3").html();
                valorInicial4 = $("#numero"+indice).children(".digito4").html();
                //console.log(valorInicial1 + "" + valorInicial2 + "" + valorInicial3 + "" +valorInicial4);
                
                contador = 0;
                
                interval = $interval(function()
                {
                    //console.log("valorIncial:" + valorInicial1 + "" + valorInicial2 + "" + valorInicial3 + "" +valorInicial4);
                    var numeroGenerado1 = Math.floor(Math.random() * 10);
                    var numeroGenerado2 = Math.floor(Math.random() * 10);
                    var numeroGenerado3 = Math.floor(Math.random() * 10);
                    var numeroGenerado4 = Math.floor(Math.random() * 10);
                    
                    
                    contador++;
                    if(contador < 20 )
                    {
                        $("#numero"+indice).children(".digito1").html(numeroGenerado1);
                        $("#numero"+indice).children(".digito2").html(numeroGenerado2);
                        $("#numero"+indice).children(".digito3").html(numeroGenerado3);
                        $("#numero"+indice).children(".digito4").html(numeroGenerado4);
                        
                    }
                    else if(contador == 20)
                    {
                        $("#numero"+indice).children(".digito1").html(valorInicial1);
                    }
                    else if(contador < 40 )
                    {
                        $("#numero"+indice).children(".digito2").html(numeroGenerado2);
                        $("#numero"+indice).children(".digito3").html(numeroGenerado3);
                        $("#numero"+indice).children(".digito4").html(numeroGenerado4);
                        
                    }
                    else if(contador == 40)
                    {
                        $("#numero"+indice).children(".digito2").html(valorInicial2);
                    }
                    else if(contador < 50 )
                    {
                        $("#numero"+indice).children(".digito3").html(numeroGenerado3);
                        $("#numero"+indice).children(".digito4").html(numeroGenerado4);
                        
                    }
                    else if(contador == 50)
                    {
                        $("#numero"+indice).children(".digito3").html(valorInicial3);
                    }
                    else if(contador < 60 )
                    {
                        $("#numero"+indice).children(".digito4").html(numeroGenerado4);
                    }
                    else if(contador == 60)
                    {
                        $("#numero"+indice).children(".digito4").html(valorInicial4);
                    }
                    else if( contador > 100)
                    {
                        $interval.cancel(interval);
                    }
                    
                },120);
                
                 //$("#numero"+indice).children(".digito1").html(valorInicial1);
            }
            
        });
        
    </script> 
    <script>
        $(document).ready(function()
        {
            console.log("estoy listo");
            //document.getElementById("encabezadoPrincipal").style.transform = "rotate(360deg)";
        });
    </script>
</html>