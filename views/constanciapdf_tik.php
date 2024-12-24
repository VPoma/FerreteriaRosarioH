<?PhP
$id_abastecer = $_GET['id'];
date_default_timezone_set("America/Lima");
$fecha_hora_ac = date('d/m/Y - g:i a');

$db = new mysqli('localhost', 'root', '', 'ferr_ros_h');
mysqli_query($db,"SET NAMES 'utf8'");

$tab1 = mysqli_query($db, "SELECT ab.total ,ab.fecha_ent,pv.nombrecom, pv.numruc, pv.direccion, c.nombre FROM abastecer ab "
                                        . "INNER JOIN proveedor pv on ab.id_proveedor = pv.id "
                                        . "INNER JOIN ciudad c on c.id = pv.id_ciudad "
                                        . "WHERE ab.id = $id_abastecer");
$t1 = $tab1->fetch_object();

$tab2 = mysqli_query($db, "SELECT pa.id_producto, pa.precio, pa.cantidad, p.nombre, p.medida, m.nombre as 'marca' FROM producto_abastecer pa "
                                        . "INNER JOIN producto p ON p.id = pa.id_producto "
                                        . "INNER JOIN marca m ON m.id = p.id_marca WHERE pa.id_abastecer = $id_abastecer");                                    

?>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Comprobante</title>
        <style type="text/css">
            .b{
                font-size: 9.5px;
            }

            .imgcabe{
                width: 260px;
                height: 110px;
            }

            h1{
                text-align: center;
            }
            /*
            .product {
                border: 1px solid black;
            }
            */
            .div2 {
                width: 270px;
                height: 160px;
                margin-left: 530px;
                position: absolute;
            }

            .rostik{
                text-align: center;
            }

            .numtik{
                border: 3px;
                text-align: center;
            }

        </style>
    </head>
    <body>
        <div class="b">
            <div>
                <img class="imgcabe" src="../assets/images/logo_inv.jpg">
            </div>
            <div>
                <table class="rostik">
                    <tr>
                        <th style="width: 250px;">DISTRIBUIDORA "ROSARIO"</th>
                    </tr>
                    <tr>
                        <th style="width: 250px;">AV. PANAMERICANA SUR N°1387</th>
                    </tr>
                    <tr>
                        <th style="width: 250px;">RUC: 10712327311</th>
                    </tr>
                </table>
                <br>
                <table class="numtik">
                    <tr>
                        <th style="width: 250px;">CONSTANCIA DE INGRESO</th>
                    </tr>
                    <tr>
                        <th style="width: 250px;">A ALMACEN</th>
                    </tr>
                    <tr>
                        <th style="width: 250px;">00000<?=$id_abastecer?></th>
                    </tr>
                </table>
            </div>
            <br>
            <table>
                <tr>
                    <td><b>Fecha: </b></td>
                    <td><?=$fecha_hora_ac?></td>
                </tr>
                <tr>
                    <td><b>RUC Prov: </b></td>
                    <td>&nbsp;<?=$t1->numruc?></td>
                </tr>
                <tr>
                    <td><b>Proveedor: </b></td>
                    <td>&nbsp;<?=$t1->nombrecom?></td>
                </tr>
                <tr>
                    <td><b>Dirección: </b></td>
                    <td>&nbsp;<?=$t1->direccion?> - <?=$t1->nombre?></td>
                </tr>
                <tr>
                    <td><b>Fecha Ing:</b></td>
                    <td>&nbsp;<?=$t1->fecha_ent?></td>
                </tr>
            </table>

            <br>

            <table>
                <tr>
                    <th style="width:20px;">Cod</th>
                    <th style="width:130px;">Descripción</th>
                    <th style="width:22px;">Cnt</th>
                    <th style="width:28px;">P.Unit</th>
                    <th style="width:32px;">Monto</th>
                </tr>
                <?Php while($t = mysqli_fetch_assoc($tab2)): ?>
                <tr>
                    <td style="width:20px;"><?=$t['id_producto']?></td>
                    <td style="width:130px;"><?=$t['marca']?> <?=$t['nombre']?> <?=$t['medida']?></td>
                    <td style="width:22px;"><?=$t['cantidad']?></td>
                    <td style="width:28px;"><?=$t['precio']?></td>
                    <?php $a = $t['precio'] * $t['cantidad']; ?>
                    <?php $total = number_format($a, 2) ?>
                    <td style="width:32px;"><?=$total?></td>
                </tr>
                <?Php endwhile;?>
                <tr>
                    <td colspan="5"></td>
                </tr>
                <tr>
                    <td style="text-align: right;" colspan="5">COSTO TOTAL: S/.<?=$t1->total?> </td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td style="text-align: center;" colspan="5">Gracias por confiar en "Rosario"</td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
            </table>
        </div>
    </body>
</html>