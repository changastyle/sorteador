<html>
    <head>
        <%@include file="head.jsp" %>
        <link rel="stylesheet" href="res/css/monitorCSS.css">
        <link rel="stylesheet" href="res/css/enComunCSS.css">
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    </head>
    <body ng-app="app" ng-controller="monitor">
        
        <div class="col-lg-6 col-lg-offset-3" ng-hide="empezoSorteo">
            <img class="col-lg-12 img-responsive img-thumbnail" src="res/img/progress.gif" style="margin-top: 5%;">
            <h2 class="hx col-lg-12" style="text-align: center;">Esperando a que comienze el sorteo..</h2>
        </div>
        <!-- CONTENEDOR PRINCIPAL -->
        <div id="contenedor" style="box-sizing: border-box;" ng-show="empezoSorteo"> 
            
            <!-- BANNER : -->
            <%@include file="banner.jsp" %>
            
            <!-- HEADER SORTEO: -->
            <div class=" col-xs-12 headerSorteo ">Sorteo {{tiempoSorteo}} del {{fechaSorteo}}: </div>
            
            <!-- LISTAS: -->
            
                 <div class="col-xs-3 listas" id="lista1" ng-repeat="p in partes" style=" margin-top: 25px;/*border:solid 2px yellow;*/"> 
                     
                    <div class="list-group" style="height: calc(100% - 250px); /*border:solid 2px #4CAF50;overflow: hidden;*/">
                        <div class="list-group-item" ng-repeat="c in p.estructura" style="margin-bottom: 12px; height: 19%; overflow: hidden; background-color:rgba(0,0,0,0.5);border-radius: 5px; border:solid 0px black;/* box-shadow: 5px 5px 5px black;*/">
                            <div class="indice ind-num-ambos col-xs-3">{{c.indice}}</div>
                            <div id="numero{{c.indice}}" class="numeroTotal ind-num-ambos col-xs-8 col-xs-offset-1">
                                <div class=" digito digito1 col-xs-3" >{{c.numero1}}</div>
                                <div class=" digito digito2 col-xs-3" >{{c.numero2}}</div>
                                <div class=" digito digito3 col-xs-3" >{{c.numero3}}</div>
                                <div class=" digito digito4 col-xs-3" >{{c.numero4}}</div>
                            </div>
                        </div>
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
            $scope.fechaSorteo = null;
            $scope.tiempoSorteo = null;
            $scope.empezoSorteo == false;
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
                
                //Consulto la fechaSorteo y el tiempoSorteo
                /*if( $scope.empezoSorteo == "false")
                {*/
                    $.ajax({url: "../WS/fechaWS.jsp",success: function (resultadoFecha, textStatus, jqXHR) 
                    {
                        resultado = JSON.parse(resultadoFecha);
                        $scope.fechaSorteo = resultado.fechaSorteo;
                        $scope.tiempoSorteo = resultado.tiempoSorteo;
                        if($scope.fechaSorteo != "null" && $scope.tiempoSorteo != "null")
                        {
                            $scope.empezoSorteo = true;
                        }
                        
                        $scope.$apply();
                        console.log("resultado Fecha WS:" + $scope.fechaSorteo + " " +$scope.tiempoSorteo);
                    }});
                
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
                var audio = new Audio('res/sound/efecto.mp3');
                
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
                        audio.play(); 
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
                        audio.pause();
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