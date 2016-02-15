<html>
    <head>
        <%@include file="head.jsp"%>
        <script>
            $().ready(function()
            {
                
                girar();

               
            });
            var contador = 0;
            var digitoActual = 1;
            function girar()
            {
                var millisecondsToWait = 250;
                setTimeout(function() 
                {
                    if(contador < 20)
                    {
                        if(digitoActual == 1)
                        {
                            girarDigito($("#test").children("#digitoUno"));
                        }
                        else if(digitoActual == 2)
                        {
                            girarDigito($("#test").children("#digitoDos"));
                        }
                        else if(digitoActual == 3)
                        {
                            girarDigito($("#test").children("#digitoTres"));
                        }
                        else if(digitoActual == 4)
                        {
                            girarDigito($("#test").children("#digitoCuatro"));
                        }
                        girar();
                    }
                    else if( contador >= 20 )
                    {
                        digitoActual ++;
                        contador = 0 ;
                        girar();
                    }
                    else if (contador >= 20 && digitoActual >=4)
                    {
                        $("#test").children("#digitoUno").html("x");
                        $("#test").children("#digitoDos").html("x");
                        $("#test").children("#digitoTres").html("x");
                        $("#test").children("#digitoCuatro").html("x");
                    }
                    
                }, millisecondsToWait);
            }
            function girarDigito(quien)
            {
                var millisecondsToWait = 150;
                setTimeout(function() 
                {
                    var numeroGenerado = Math.floor(Math.random() * 10);
                    $(quien).html(numeroGenerado);
                    var audio = new Audio('audio_file.mp3');
                    audio.play();
                    contador++;
                    
                    if(contador < 20)
                    {
                        girarDigito(quien);
                    }
                    else
                    {
                        $("#test").children("#digitoUno").html(numero1);
                        $("#test").children("#digitoDos").html(numero2);
                        $("#test").children("#digitoTres").html(numero3);
                        $("#test").children("#digitoCuatro").html(numero4);
                    }
                }, millisecondsToWait);
                
            }
        </script>
        
    </head>
    <body>
        <div class="container-fluid body">
            
            <div class="container">
                <h2 class="hx">Tablero Digital!</h2>
            </div>

            <!--<img class="img-thumbnail img-responsive" src="res/img/dinero-enrollado.jpeg">-->
            <div class='container wrap1'>
                <div class="hx"><h3>Sorteo Matutino del 10/02/2016:</h3></div>
                <ul class="list-group col-xs-3" >
                    <!--<li class="list-group-item active"><h5 class="hs">Sorteos del 0 al 5:</h5></li>-->
                    <li class="list-group-item">
                        <div class="row">
                            <div class="indice col-xs-2">1)</div>
                            <div id="test" class="numero col-xs-10 row">
                                <span class="digito col-xs-3" id="digitoUno"></span>
                                <span class="digito col-xs-3" id="digitoDos"></span>
                                <span class="digito col-xs-3" id="digitoTres"></span>
                                <span class="digito col-xs-3" id="digitoCuatro"></span>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">2)</li>
                    <li class="list-group-item">3)</li>
                    <li class="list-group-item">4)</li>
                    <li class="list-group-item">5)</li>
                </ul>
                <ul class="list-group col-xs-3" style="margin-top:15px;">
                    <!--<li class="list-group-item active"><h5 class="hs">Sorteos del 5 al 10:</h5></li>-->
                    <li class="list-group-item">6.</li>
                    <li class="list-group-item">7.</li>
                    <li class="list-group-item">8.</li>
                    <li class="list-group-item">9.</li>
                    <li class="list-group-item">10.</li>
                </ul>
                <ul class="list-group col-xs-3" style="margin-top:15px;">
                    <!--<li class="list-group-item active"><h5 class="hs">Sorteos del 10 al 15:</h5></li>-->
                    <li class="list-group-item">11.</li>
                    <li class="list-group-item">12.</li>
                    <li class="list-group-item">13.</li>
                    <li class="list-group-item">14.</li>
                    <li class="list-group-item">15.</li>
                </ul>
                <ul class="list-group col-xs-3" style="margin-top:15px;">
                    <!--<li class="list-group-item active"><h5 class="hs">Sorteos del 15 al 20:</h5></li>-->
                    <li class="list-group-item">16.</li>
                    <li class="list-group-item">17.</li>
                    <li class="list-group-item">18.</li>
                    <li class="list-group-item">19.</li>
                    <li class="list-group-item">20.</li>
                </ul>
            </div>
        </div>
        <h3></h3>
    </body>
</html>