<?PhP
$f1 = $_GET['f1'];
$f2 = $_GET['f2'];
$r = $_GET['r'];

$db = new mysqli('localhost', 'root', '', 'ferr_ros_h');
mysqli_query($db,"SET NAMES 'utf8'");

if($r){
    $tab1 = mysqli_query($db, "SELECT c.id, c.numdoc, c.nombrecom, c.direccion, c.numcel, td.documento, ci.nombre as 'ciudad', COALESCE(COUNT(cu.id), 0) AS 'total_ventas' " 
                            . "FROM cliente c LEFT JOIN cuaderno cu ON cu.id_cliente = c.id INNER JOIN tipodoc td ON td.id = c.id_tipodoc INNER JOIN ciudad ci ON ci.id = c.id_ciudad "
                            . "WHERE cu.fecha BETWEEN '$f1' AND '$f2' AND c.est = 'H' GROUP BY c.id, c.nombrecom ORDER BY total_ventas DESC LIMIT $r;");
}else{
    $tab1 = mysqli_query($db, "SELECT c.id, c.numdoc, c.nombrecom, c.direccion, c.numcel, td.documento, ci.nombre as 'ciudad', COALESCE(COUNT(cu.id), 0) AS 'total_ventas' " 
                            . "FROM cliente c LEFT JOIN cuaderno cu ON cu.id_cliente = c.id INNER JOIN tipodoc td ON td.id = c.id_tipodoc INNER JOIN ciudad ci ON ci.id = c.id_ciudad "
                            . "WHERE cu.fecha BETWEEN '$f1' AND '$f2' AND c.est = 'H' GROUP BY c.id, c.nombrecom ORDER BY total_ventas DESC;");
}

if($r){
    $tab2 = mysqli_query($db, "SELECT c.id, c.numdoc, c.nombrecom, c.direccion, c.numcel, td.documento, ci.nombre as 'ciudad', COALESCE(COUNT(cu.id), 0) AS 'total_ventas' " 
                            . "FROM cliente c LEFT JOIN cuaderno cu ON cu.id_cliente = c.id INNER JOIN tipodoc td ON td.id = c.id_tipodoc INNER JOIN ciudad ci ON ci.id = c.id_ciudad "
                            . "WHERE cu.fecha BETWEEN '$f1' AND '$f2' AND c.est = 'H' GROUP BY c.id, c.nombrecom ORDER BY total_ventas DESC LIMIT $r;");
}else{
    $tab2 = mysqli_query($db, "SELECT c.id, c.numdoc, c.nombrecom, c.direccion, c.numcel, td.documento, ci.nombre as 'ciudad', COALESCE(COUNT(cu.id), 0) AS 'total_ventas' " 
                            . "FROM cliente c LEFT JOIN cuaderno cu ON cu.id_cliente = c.id INNER JOIN tipodoc td ON td.id = c.id_tipodoc INNER JOIN ciudad ci ON ci.id = c.id_ciudad "
                            . "WHERE cu.fecha BETWEEN '$f1' AND '$f2' AND c.est = 'H' GROUP BY c.id, c.nombrecom ORDER BY total_ventas DESC;");
}

?>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Comprobante</title>
        <style type="text/css">
            .b{
                margin-top: 5px;
                margin-left: 8px;
                margin-right: 8px;
                margin-bottom: 5px;
            }

            h1{
                text-align: center;
                color: #d62a2a;
            }

            h2{
                text-align: center;
                color: #d62a2a;
            }

            h3{
                text-align: center;
                color: #d62a2a;
            }
            
            .tablita {
                text-align: center;
                width: 80%;
                margin-left: 2px;
                /*border-bottom: 1px solid #ccc;*/
                border-bottom: 1px solid #ebebfd;
                word-wrap: break-word;
            }

            .tablita th,td{
                /*border: solid 1px black;*/
                /*border-collapse: collapse;*/
                text-align: center;
                padding-top: 1px;
                padding-bottom: 5px;
            }

            .tablita th{
                background-color: #d62a2a;
                color: white;
            }

            .tablita tr:nth-child(odd){
                /*background-color: #e9eaff;*/
                background-color: #fff2f2;
            }

        </style>
    </head>
    <body>
        <div class="b">
        <h1>TOP <?=$r?> DE CLIENTES</h1>

        <h2>Reporte de Clientes Frecuentes del <?=$f1?> al <?=$f2?> </h2>

        <br>

        <table class="tablita">
            <tr>
                <th style="width:15px;">Id</th>
                <th style="width:50px;">Doc</th>
                <th style="width:90px;">Número</th>
                <th style="width:120px;">Nombre</th>
                <th style="width:180px;">Dirección</th>
                <th style="width:100px;">Ciudad</th>
                <th style="width:80px;">Celular</th>
                <th style="width:40px;">Total</th>
            </tr>
            <?Php $num = 1?>
            <?Php while($t = $tab2->fetch_object()): ?>
                <tr>
                    <td style="width:15px;"><?=$num?></td>
                    <td style="width:50px;"><?=$t->documento?></td>
                    <td style="width:90px;"><?=$t->numdoc?></td>
                    <td style="width:120px;"><?=$t->nombrecom?></td>
                    <td style="width:180px;"><?=$t->direccion?></td>
                    <td style="width:100px;"><?=$t->ciudad?></td>
                    <td style="width:80px;"><?=$t->numcel?></td>
                    <td style="width:40px;"><?=$t->total_ventas?></td>
                </tr>
                <?Php $num++;?>
            <?Php endwhile;?>
        </table>
        </div>
    </body>
</html>