<?PhP
$id_cuaderno = $_GET['id'];

$db = new mysqli('localhost', 'root', '', 'ferr_ros_h');
mysqli_query($db,"SET NAMES 'utf8'");

$tab1 = mysqli_query($db, "SELECT cu.total ,cu.fecha_sal,ci.nombrecom, ci.numdoc, ci.direccion, c.nombre FROM cuaderno cu "
                                        . "INNER JOIN cliente ci on cu.id_cliente = ci.id "
                                        . "INNER JOIN ciudad c on c.id = ci.id_ciudad "
                                        . "WHERE cu.id = $id_cuaderno");
$t1 = $tab1->fetch_object();

$tab2 = mysqli_query($db, "SELECT pc.id_producto, pc.precio, pc.cantidad, p.nombre, p.medida, m.nombre as 'marca' FROM producto_cuaderno pc "
                                        . "INNER JOIN producto p ON p.id = pc.id_producto "
                                        . "INNER JOIN marca m ON m.id = p.id_marca WHERE pc.id_cuaderno = $id_cuaderno");                                    
$tab3 = mysqli_query($db, "SELECT p.codigo, pc.id_producto, pc.precio, pc.cantidad, p.nombre, p.medida, m.nombre as 'marca' FROM producto_cuaderno pc "
                                        . "INNER JOIN producto p ON p.id = pc.id_producto "
                                        . "INNER JOIN marca m ON m.id = p.id_marca WHERE pc.id_cuaderno = $id_cuaderno");

$tab4 = mysqli_query($db, "SELECT p.codigo, pc.id_producto, pc.precio, pc.cantidad, p.nombre, p.medida, m.nombre as 'marca' FROM producto_cuaderno pc "
                                        . "INNER JOIN producto p ON p.id = pc.id_producto "
                                        . "INNER JOIN marca m ON m.id = p.id_marca WHERE pc.id_cuaderno = $id_cuaderno"); 

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

            .imgcabe{
                width: 500px;
                height: 150px;
            }

            h1{
                text-align: center;
            }
            
            .datoclie{
                margin-left: 40px;
            }

            .datoclie th{
                height: 20px;
            }

            .datoclie .tit{
                text-align: left;
            }

            .datoclie .tam{
                width: 380px;
            }
            /*
            .product {
                border: 1px solid black;
            }
            */
            .div1{
                margin-left: 20px;
            }

            .div2 {
                width: 270px;
                height: 160px;
                margin-left: 530px;
                position: absolute;
            }

            .numtik{
                border: 3px;
                margin-top: 60px;
                text-align: center;
            }

        </style>
    </head>
    <body>
        <div class="b">
            <div class="div2">
                <table class="numtik">
                    <tr>
                        <th style="width: 200px; HEIGHT: 20px;">R.U.C. 10712327311</th>
                    </tr>
                    <tr>
                        <th style="width: 200px;">TICKET</th>
                    </tr>

                    <tr>
                        <th style="width: 200px; HEIGHT: 20px;"><?=$id_cuaderno?></th>
                    </tr>

                </table>
            </div>

            <div class="div1">
                <img class="imgcabe" src="../assets/images/Encabcom.jpg">
            </div>  
        
            <br>
            <br>
            
            <table class="datoclie">
                <tr>
                    <td class="tit">
                        <b>Señor(es): </b>
                    </td>
                    <td class="tam">
                        &nbsp;&nbsp;&nbsp;&nbsp;<?=$t1->nombrecom?>
                    </td>
                    <td class="tit">
                        <b>RUC/DNI:</b>
                    </td>
                    <td class="tam">
                        &nbsp;&nbsp;&nbsp;&nbsp;<?=$t1->numdoc?>
                    </td>
                </tr>
                <tr>
                    <td class="tit">
                        <b>Dirección:</b>
                    </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;<?=$t1->direccion?> - <?=$t1->nombre?>
                    </td>
                    <td class="tit">
                        <b>Fecha:</b>
                    </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;<?=$t1->fecha_sal?>
                    </td>
                </tr>
            </table>

            <br>
            <br>

            <table>
                <tr>
                    <th style="width:40px;">Item</th>
                    <th style="width:130px;">Marca</th>
                    <th style="width:330px;">Descripción</th>
                    <th style="width:60px;">Precio U.</th>
                    <th style="width:60px;">Cantidad</th>
                    <th style="width:75px;">Valor Total</th>
                </tr>
                <?Php while($t = mysqli_fetch_assoc($tab2)): ?>
                <tr>
                    <td style="width:40px;"><?=$t['id_producto']?></td>
                    <td style="width:130px;"><?=$t['marca']?></td>
                    <td style="width:330px;"><?=$t['nombre']?> <?=$t['medida']?></td>
                    <td style="width:60px;"><?=$t['precio']?></td>
                    <td style="width:60px;"><?=$t['cantidad']?></td>
                    <?php $a = $t['precio'] * $t['cantidad']; ?>
                    <?Php $total = number_format($a, 2)?>

                    <td style="width:75px;"><?=$total?></td>
                </tr>
                <?Php endwhile;?>
                <tr>
                    <td colspan="6">.</td>
                </tr>
                <tr>
                    <td colspan="3"></td>
                    <td>TOTAL</td>
                    <td>S/.</td>
                    <td><?=$t1->total?></td>
                </tr>
            </table>

        </div>
    </body>
</html>