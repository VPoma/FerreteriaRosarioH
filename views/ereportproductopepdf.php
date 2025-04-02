<?PhP
$f1 = $_GET['f1'];
$f2 = $_GET['f2'];
$r = $_GET['r'];

$db = new mysqli('localhost', 'root', '', 'ferr_ros_h');
mysqli_query($db,"SET NAMES 'utf8'");

if($r){
    $tab1 = mysqli_query($db, "SELECT p.id, p.codigo ,p.nombre, p.medida, m.nombre as 'marca', COALESCE(SUM(pc.cantidad), 0) AS 'total_ventas' "
                            . "FROM producto p LEFT JOIN producto_cuaderno pc ON pc.id_producto = p.id INNER JOIN marca m ON p.id_marca = m.id INNER JOIN cuaderno cu ON cu.id = pc.id_cuaderno "
                            . "WHERE cu.fecha BETWEEN '$f1' AND '$f2' AND cu.estado = 'VENDIDO' AND p.est = 'H' AND pc.est = 'H' GROUP BY p.id, p.nombre ORDER BY total_ventas DESC LIMIT $r");
}else{
    $tab1 = mysqli_query($db, "SELECT p.id, p.codigo ,p.nombre, p.medida, m.nombre as 'marca', COALESCE(SUM(pc.cantidad), 0) AS 'total_ventas' "
                            . "FROM producto p LEFT JOIN producto_cuaderno pc ON pc.id_producto = p.id INNER JOIN marca m ON p.id_marca = m.id INNER JOIN cuaderno cu ON cu.id = pc.id_cuaderno "
                            . "WHERE cu.fecha BETWEEN '$f1' AND '$f2' AND cu.estado = 'VENDIDO' AND p.est = 'H' AND pc.est = 'H' GROUP BY p.id, p.nombre ORDER BY total_ventas DESC;");
}

if($r){
    $tab2 = mysqli_query($db, "SELECT p.id, p.codigo ,p.nombre, p.medida, m.nombre as 'marca', COALESCE(SUM(pc.cantidad), 0) AS 'total_ventas' "
                            . "FROM producto p LEFT JOIN producto_cuaderno pc ON pc.id_producto = p.id INNER JOIN marca m ON p.id_marca = m.id INNER JOIN cuaderno cu ON cu.id = pc.id_cuaderno "
                            . "WHERE cu.fecha BETWEEN '$f1' AND '$f2' AND cu.estado = 'VENDIDO' AND p.est = 'H' AND pc.est = 'H' GROUP BY p.id, p.nombre ORDER BY total_ventas DESC LIMIT $r");
}else{
    $tab2 = mysqli_query($db, "SELECT p.id, p.codigo ,p.nombre, p.medida, m.nombre as 'marca', COALESCE(SUM(pc.cantidad), 0) AS 'total_ventas' "
                            . "FROM producto p LEFT JOIN producto_cuaderno pc ON pc.id_producto = p.id INNER JOIN marca m ON p.id_marca = m.id INNER JOIN cuaderno cu ON cu.id = pc.id_cuaderno "
                            . "WHERE cu.fecha BETWEEN '$f1' AND '$f2' AND cu.estado = 'VENDIDO' AND p.est = 'H' AND pc.est = 'H' GROUP BY p.id, p.nombre ORDER BY total_ventas DESC;");
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
                margin-left: 20px;
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
        <h1>TOP <?=$r?> DE TODOS LOS PRODUCTOS POR ENTREGAR</h1>

        <h2>Reporte de Todos los Productos Por Entregar Más Vendidos del <?=$f1?> al <?=$f2?> </h2>

        <br>

        <table class="tablita">
        <tr>
            <th style="width:30px;">Id</th>
            <th style="width:70px;">Cod</th>
            <th style="width:220px;">Marca</th>
            <th style="width:220px;">Nombre</th>
            <th style="width:80px;">Medida</th>
            <th style="width:50px;">Total</th>
        </tr>
        <?Php $num = 1?>
        <?Php while($t = $tab2->fetch_object()): ?>
            <tr>
                <td style="width:30px;"><?=$num?></td>
                <td style="width:70px;"><?=$t->codigo?></td>
                <td style="width:220px;"><?=$t->marca?></td>
                <td style="width:220px;"><?=$t->nombre?></td>
                <td style="width:80px;"><?=$t->medida?></td>
                <?Php
                $total = $t->total_ventas;
                // Verifica si el número tiene decimales
                if (floor($total) == $total){
                    // Si no tiene decimales, muestra el número sin decimales
                    $totalv = number_format($total, 0);
                }else{
                    // Si tiene decimales, muestra el número con dos decimales
                    $totalv = number_format($total, 2);
                }
                ?>
                <td><?=$totalv?></td>
            </tr>
            <?Php $num++;?>
        <?Php endwhile;?>
        </table>
        </div>
    </body>
</html>