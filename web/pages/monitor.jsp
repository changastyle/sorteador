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
            <div class=" col-xs-12 headerSorteo ">Sorteo {{tiempoSorteo}} del {{fechaSorteo}} </div>

            <!-- LISTAS: -->

            <div class="col-lg-3 col-md-6 listas" id="lista1" ng-repeat="p in partes" style=" margin-top: 25px;/*border:solid 2px yellow;*/"> 

                <div class="list-group" style="height: calc(100% - 250px); overflow: hidden;">
                    <div class="list-group-item cuadrado" ng-repeat="c in p.estructura">
                        <div class="indice ind-num-ambos col-xs-4">{{c.indice}}</div>
                        <div id="numero{{c.indice}}" class="numeroTotal ind-num-ambos col-xs-8 ">
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
        var bandera = false;
        app = angular.module('app', []);

        app.controller('monitor', function ($scope, $http, $interval)
        {
            $scope.arrViejo = new Array();
            $scope.registros = new Array();
            $scope.fechaSorteo = null;
            $scope.tiempoSorteo = null;
            $scope.empezoSorteo == false;
            $scope.partes = new Array({'indice': 1, 'estructura': new Array()}, {'indice': 2, 'estructura': new Array()}, {'indice': 3, 'estructura': new Array()}, {'indice': 4, 'estructura': new Array()});
            /*$scope.partes.estructura1 = new Array();
             $scope.partes.estructura2 = new Array();
             $scope.partes.estructura3 = new Array();
             $scope.partes.estructura4 = new Array();*/

            $scope.limpiarTodo = function () {
                console.log("LIMPIA");
                for (i = 1; i <= 5; i++)
                {
                    /*numero1 = Math.round(Math.random() * 9999).toString();
                     numero2 = Math.round(Math.random() * 9999).toString();
                     numero3= Math.round(Math.random() * 9999).toString();
                     numero4= Math.round(Math.random() * 9999).toString();*/

                    numero1 = "    ";
                    numero2 = "    ";
                    numero3 = "    ";
                    numero4 = "    ";

                    $scope.partes[0].estructura.push({"indice": i, "numero1": numero1.charAt(0), "numero2": numero1.charAt(1), "numero3": numero1.charAt(2), "numero4": numero1.charAt(3)});
                    $scope.partes[1].estructura.push({"indice": (i + 5), "numero1": numero2.charAt(0), "numero2": numero2.charAt(1), "numero3": numero2.charAt(2), "numero4": numero2.charAt(3)});
                    $scope.partes[2].estructura.push({"indice": (i + 10), "numero1": numero3.charAt(0), "numero2": numero3.charAt(1), "numero3": numero3.charAt(2), "numero4": numero3.charAt(3)});
                    $scope.partes[3].estructura.push({"indice": (i + 15), "numero1": numero4.charAt(0), "numero2": numero4.charAt(1), "numero3": numero4.charAt(2), "numero4": numero4.charAt(3)});
                    
                }
            }

            $scope.limpiarTodo();

            $interval(function ()
            {

                //console.log("bucleo");
                $.ajax(
                        {
                            url: "../WS/estado.jsp",
                            beforeSend: function (xhr)
                            {
                                //console.log("consultando jugadas..");
                            }, success: function (resultado, textStatus, jqXHR)
                            {
                                arr = JSON.parse(resultado);

                                //console.log("resultado: " + JSON.stringify(arr) +" Viejo: " +JSON.stringify($scope.arrViejo));

                                //COMPARO ARRAY VIEJO CON EL ARRAY NUEVO:
                                if (JSON.stringify(arr) != JSON.stringify($scope.arrViejo))
                                {
                                    console.log("LARGO: " + arr.length);
                                    if (arr.length == 0) 
                                    {
                                       /*$("#contenedor").children(".digito1").html(" ");
                                        $("#contenedor").children(".digito2").html(" ");
                                        $("#contenedor").children(".digito3").html(" ");
                                        $("#contenedor").children(".digito4").html(" ");*/
                                        $(".digito").each(function(index,element)
                                        {
                                            $(element).html(" ");
                                        });
                                        //$scope.limpiarTodo();
                                        //$scope.$apply();
                                    }

                                    console.log("arrViejo != arrNuevo : " + JSON.stringify(arr) != JSON.stringify($scope.arrViejo));
                                    for (i = 0; i < arr.length; i++)
                                    {
                                        jugada = arr[i];
                                        //console.log("JUG: " + jugada.numero.charAt(0));

                                        //console.log("JUG: " + JSON.stringify( jugada));

                                        indice = parseInt(jugada.indice);
                                        //console.log("Indice: "+indice);
                                        if (jugada == "") {
                                            $("#numero" + indice).children(".digito1").html("");
                                            $("#numero" + indice).children(".digito2").html("");
                                            $("#numero" + indice).children(".digito3").html("");
                                            $("#numero" + indice).children(".digito4").html("");
                                        }

                                        if (indice <= 5)
                                        {
                                            $scope.partes[0].estructura[(indice - 1)] = {"indice": indice, "numero1": jugada.numero.charAt(0), "numero2": jugada.numero.charAt(1), "numero3": jugada.numero.charAt(2), "numero4": jugada.numero.charAt(3)};
                                            //console.log(jugada.numero + " | " + jugada.numero.toString().charAt(0) + " | "+  jugada.numero.toString().charAt(1) +" | "+ jugada.numero.toString().charAt(2) + " | "+  jugada.numero.toString().charAt(3) );
                                            //console.log($scope.estructura1[i]);
                                            $scope.$apply();
                                        }
                                        else if (indice > 5 && indice < 10)
                                        {
                                            $scope.partes[1].estructura[(indice - 6)] = {"indice": indice, "numero1": jugada.numero.charAt(0), "numero2": jugada.numero.charAt(1), "numero3": jugada.numero.charAt(2), "numero4": jugada.numero.charAt(3)};
                                            $scope.$apply();
                                        }
                                        else if (indice > 10 && indice < 15)
                                        {
                                            $scope.partes[2].estructura[(indice - 11)] = {"indice": indice, "numero1": jugada.numero.charAt(0), "numero2": jugada.numero.charAt(1), "numero3": jugada.numero.charAt(2), "numero4": jugada.numero.charAt(3)};
                                            $scope.$apply();
                                        }
                                        else if (indice > 15 && indice < 20)
                                        {
                                            $scope.partes[3].estructura[(indice - 16)] = {"indice": indice, "numero1": jugada.numero.charAt(0), "numero2": jugada.numero.charAt(1), "numero3": jugada.numero.charAt(2), "numero4": jugada.numero.charAt(3)};
                                            $scope.$apply();
                                        }

                                        //HAGO GIRAR LAS QUE CAMBIARON:
                                        if (JSON.stringify($scope.arrViejo[i]) != JSON.stringify(arr[i]))
                                        {
                                            console.log("viejo :" + JSON.stringify($scope.arrViejo[i]) + " | nuevo:" + JSON.stringify(arr[i]));
                                            //console.log("jugada:" +jugada.numero);
                                            if (!bandera)
                                            {
                                                bandera = true;
                                                $scope.girar(parseInt(arr[i].indice) - 1, jugada.numero);
                                            }
                                        }
                                    }
                                    $scope.arrViejo = arr;
                                }
                            }
                            , async: true
                        });

                //Consulto la fechaSorteo y el tiempoSorteo
                /*if( $scope.empezoSorteo == "false")
                 {*/
                $.ajax({url: "../WS/fechaWS.jsp", success: function (resultadoFecha, textStatus, jqXHR)
                    {
                        resultado = JSON.parse(resultadoFecha);
                        $scope.fechaSorteo = resultado.fechaSorteo;
                        $scope.tiempoSorteo = resultado.tiempoSorteo;
                        if ($scope.fechaSorteo != "null" && $scope.tiempoSorteo != "null")
                        {
                            $scope.empezoSorteo = true;
                        }

                        $scope.$apply();
                        //   console.log("resultado Fecha WS:" + $scope.fechaSorteo + " " +$scope.tiempoSorteo);
                    }});

                }, 250);



            $scope.girar = function (indice, numero)
            {
                indice = (indice + 1);
                $("#numero" + indice).css("background-color", "red");
                console.log("girando.. " + indice + " NUMERO: " + numero);
                //console.log( $("#numero"+indice).children(".digito1").html() );
                //valorInicial1 = $("#numero"+indice).children(".digito1").html();
                //valorInicial2 = $("#numero"+indice).children(".digito2").html();
                //valorInicial3 = $("#numero"+indice).children(".digito3").html();
                //valorInicial4 = $("#numero"+indice).children(".digito4").html();
                dig1 = numero.charAt(0);
                dig2 = numero.charAt(1);
                dig3 = numero.charAt(2);
                dig4 = numero.charAt(3);

                //console.log(valorInicial1 + "" + valorInicial2 + "" + valorInicial3 + "" +valorInicial4);
                //var audio = new Audio('res/sound/efecto.mp3');

                contador = 0;

                interval = $interval(function ()
                {
                    //console.log("valorIncial:" + valorInicial1 + "" + valorInicial2 + "" + valorInicial3 + "" +valorInicial4);
                    var numeroGenerado1 = Math.floor(Math.random() * 10);
                    var numeroGenerado2 = Math.floor(Math.random() * 10);
                    var numeroGenerado3 = Math.floor(Math.random() * 10);
                    var numeroGenerado4 = Math.floor(Math.random() * 10);
                    var ind = indice;

                    //console.log("girando.. " + indice );
                    contador++;
                    if (contador < 20)
                    {
                        //audio.play(); 
                        $("#numero" + ind).children(".digito1").html(numeroGenerado1);
                        $("#numero" + ind).children(".digito2").html(numeroGenerado2);
                        $("#numero" + ind).children(".digito3").html(numeroGenerado3);
                        $("#numero" + ind).children(".digito4").html(numeroGenerado4);

                    }
                    else if (contador == 20)
                    {
                        $("#numero" + ind).children(".digito1").html(dig1);
                    }
                    else if (contador < 30)
                    {
                        $("#numero" + ind).children(".digito2").html(numeroGenerado2);
                        $("#numero" + ind).children(".digito3").html(numeroGenerado3);
                        $("#numero" + ind).children(".digito4").html(numeroGenerado4);

                    }
                    else if (contador == 30)
                    {
                        $("#numero" + ind).children(".digito2").html(dig2);
                    }
                    else if (contador < 35)
                    {
                        $("#numero" + ind).children(".digito3").html(numeroGenerado3);
                        $("#numero" + ind).children(".digito4").html(numeroGenerado4);

                    }
                    else if (contador == 35)
                    {
                        $("#numero" + ind).children(".digito3").html(dig3);
                    }
                    else if (contador < 38)
                    {
                        $("#numero" + ind).children(".digito4").html(numeroGenerado4);
                    }
                    else if (contador == 38)
                    {
                        $("#numero" + ind).children(".digito4").html(dig4);
                        //audio.pause();
                        $interval.cancel(interval);
                        bandera = false;
                    }

                }, 60);

                //$("#numero"+indice).children(".digito1").html(valorInicial1);
                $("#numero" + indice).css("background-color", "white");
            }



        });

    </script> 
    <script>
        $(document).ready(function ()
        {
            console.log("estoy listo");
            //document.getElementById("encabezadoPrincipal").style.transform = "rotate(360deg)";
        });
    </script>
</html>