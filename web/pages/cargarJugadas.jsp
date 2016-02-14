<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp"%>
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
        </style>
        <script>
        $(document).ready(function()
        {
            fechaActual = new Date();
            console.log(fechaActual.getHours());
            document.getElementById('datePicker').valueAsDate = new Date();
            
            if(fechaActual.getHours()< 12)
            {
                document.getElementById("comboSorteo").selectedIndex = "0";
            }
            else if(fechaActual.getHours()> 12 && fechaActual.getHours()< 18)
            {
                document.getElementById("comboSorteo").selectedIndex = "1";
            }
            else
            {
                document.getElementById("comboSorteo").selectedIndex = "2";
            }
        });
            </script>
    </head>
    <body>
        <%@include file="navBar.jsp"%>
       
        <div class="container wrap1">
            <form class="form-horizontal" style="background-color:white; border-radius: 5px; padding:12px;">
                <h3 class="hs" style="font-size: 24px;">Formulario carga de jugadas:</h3>
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
                    <table class="table table-responsive">
                        <thead>
                            <th class="col-xs-2">Numero de Sorteo</th>
                            <th class="col-xs-4">Valor</th>
                            <th class="col-xs-2">Numero de Sorteo</th>
                            <th class="col-xs-4">Valor</th>
                        </thead>
                        <tr>
                            <td class="col-xs-2"><label>1:</label></td>
                            <td class="col-xs-4"><input class="form-control" type="number" name="1" placeholder="Cargar Primer Jugada acá.."></td>
                            <td class="col-xs-2"><label>11:</label></td>
                            <td class="col-xs-4"><input class="form-control" type="number" name="11" placeholder="Cargar Decimo Primer Jugada acá.."></td>
                        </tr>
                        <tr>
                            <td class="col-xs-2"><label>2:</label></td>
                            <td class="col-xs-4"><input class="form-control" type="number" name="1" placeholder="Cargar Segunda Jugada acá.."></td>
                            <td class="col-xs-2"><label>12:</label></td>
                            <td class="col-xs-4"><input class="form-control" type="number" name="11" placeholder="Cargar Decimo Primer Jugada acá.."></td>
                        </tr>
                        <tr>
                            <td class="col-xs-2"><label>3:</label></td>
                            <td class="col-xs-4"><input class="form-control" type="number" name="1" placeholder="Cargar Tercer Jugada acá.."></td>
                            <td class="col-xs-2"><label>13:</label></td>
                            <td class="col-xs-4"><input class="form-control" type="number" name="11" placeholder="Cargar Decimo Primer Jugada acá.."></td>
                        </tr>
                        <tr>
                            <td class="col-xs-2"><label>4:</label></td>
                            <td class="col-xs-4"><input class="form-control" type="number" name="1" placeholder="Cargar Cuarta Jugada acá.."></td>
                            <td class="col-xs-2"><label>14:</label></td>
                            <td class="col-xs-4"><input class="form-control" type="number" name="11" placeholder="Cargar Decimo Primer Jugada acá.."></td>
                        </tr>
                        
                        
                    </table>
                </div>
                <div class="form-group">
                    <button class="btn btn-success " style="margin:12px;">Cargar!</button>
                </div>
            </form>
        </div>
       
    </body>
</html>
