<?PhP
$id_cuaderno = $_GET['id'];
date_default_timezone_set("America/Lima");
$fecha_hora_ac = date('d/m/Y - g:i a');

$db = new mysqli('localhost', 'root', '', 'ferr_ros_h');
mysqli_query($db,"SET NAMES 'utf8'");

$tab1 = mysqli_query($db, "SELECT cu.id_cua, cu.total, cu.fecha_sal, cu.descripcion,ci.nombrecom, ci.numdoc, ci.direccion, c.nombre FROM cuaderno cu "
                                        . "INNER JOIN cliente ci on cu.id_cliente = ci.id "
                                        . "INNER JOIN ciudad c on c.id = ci.id_ciudad "
                                        . "WHERE cu.id = $id_cuaderno");
$t1 = $tab1->fetch_object();

if (isset($t1->fecha_sal)) {
    $estado = 'Entregado el: '.$t1->fecha_sal;
}else{
    $estado = "Por Entregar";
}

$tab2 = mysqli_query($db, "SELECT p.codigo, pc.id_producto, pc.precio, pc.cantidad, p.nombre, p.medida, m.nombre as 'marca' FROM producto_cuaderno pc "
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
                        <th style="width: 250px;">REAL HOMECENTER S.A.C</th>
                    </tr>
                    <tr>
                        <th style="width: 250px;">CALLE REAL N° 2417 - CHILCA</th>
                    </tr>
                    <tr>
                        <th style="width: 250px;">RUC: 20613397052</th>
                    </tr>
                </table>
                <br>
                <table class="numtik">
                    <tr>
                        <th style="width: 250px;">TICKET DE VENTA</th>
                    </tr>
                    <tr>
                        <th style="width: 250px;">00000<?=$t1->id_cua?></th>
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
                    <td><b>RUC Clie: </b></td>
                    <td>&nbsp;<?=$t1->numdoc?></td>
                </tr>
                <tr>
                    <td><b>Cliente: </b></td>
                    <td>&nbsp;<?=$t1->nombrecom?></td>
                </tr>
                <tr>
                    <td><b>Dirección: </b></td>
                    <td style="width: 180px;">&nbsp;<?=$t1->direccion?> - <?=$t1->nombre?></td>
                </tr>
                <tr>
                    <td><b>Situación:</b></td>
                    <td>&nbsp;<b><?=$estado?></b></td>
                </tr>
                <!--
                <tr>
                    <td><b>Observación:</b></td>
                    <td style="width: 180px;">&nbsp;<b><?//=$t1->descripcion?></b></td>
                </tr>
                -->
            </table>

            <br>

            <table>
                <tr>
                    <th style="width:20px;">Cod</th>
                    <th style="width:22px;">Cnt</th>
                    <th style="width:100px;">Descripción</th>
                    <th style="width:28px;">P.Unit</th>
                    <th style="width:32px;">Monto</th>
                </tr>
                <?Php while($t = mysqli_fetch_assoc($tab2)): ?>
                <tr>
                    <td style="width:35px;"><?=$t['codigo']?></td>
                    <?Php
                    $unidades = $t['cantidad'];
                    // Verifica si el número tiene decimales
                    if (floor($unidades) == $unidades){
                        // Si no tiene decimales, muestra el número sin decimales
                        $cantidad = number_format($unidades, 0);
                    }else{
                        // Si tiene decimales, muestra el número con dos decimales
                        $cantidad = number_format($unidades, 2);
                    }
                    ?>
                    <td style="width:22px;"><b><?=$cantidad?></b></td>
                    <td style="width:100px;"><?=$t['marca']?> <?=$t['nombre']?> <?=$t['medida']?></td>
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
                    <td style="text-align: right; font-size: 12px;" colspan="5"><b>TOTAL A PAGAR: S/.<?=$t1->total?> </b></td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                <td colspan="5">&nbsp;<b>OBS: <?=$t1->descripcion?></b></td>
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

        <div class="page-break"></div>

        <div class="b">
            <div>
                <img class="imgcabe" src="../assets/images/logo_inv.jpg">
            </div>
            <div>
                <table class="rostik">
                    <tr>
                        <th style="width: 250px;">REAL HOMECENTER S.A.C</th>
                    </tr>
                    <tr>
                        <th style="width: 250px;">CALLE REAL N° 2417 - CHILCA</th>
                    </tr>
                    <tr>
                        <th style="width: 250px;">RUC: 20613397052</th>
                    </tr>
                </table>
                <br>
                <table class="numtik">
                    <tr>
                        <th style="width: 250px;">TICKET DE VENTA</th>
                    </tr>
                    <tr>
                        <th style="width: 250px;">00000<?=$t1->id_cua?></th>
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
                    <td><b>RUC Clie: </b></td>
                    <td>&nbsp;<?=$t1->numdoc?></td>
                </tr>
                <tr>
                    <td><b>Cliente: </b></td>
                    <td>&nbsp;<?=$t1->nombrecom?></td>
                </tr>
                <tr>
                    <td><b>Dirección: </b></td>
                    <td style="width: 180px;">&nbsp;<?=$t1->direccion?> - <?=$t1->nombre?></td>
                </tr>
                <tr>
                    <td><b>Situación:</b></td>
                    <td>&nbsp;<b><?=$estado?></b></td>
                </tr>
                <!--
                <tr>
                    <td><b>Observación:</b></td>
                    <td style="width: 180px;">&nbsp;<b><?//=$t1->descripcion?></b></td>
                </tr>
                -->
            </table>

            <br>

            <table>
                <tr>
                    <th style="width:20px;">Cod</th>
                    <th style="width:22px;">Cnt</th>
                    <th style="width:100px;">Descripción</th>
                    <th style="width:28px;">P.Unit</th>
                    <th style="width:32px;">Monto</th>
                </tr>
                <?Php while($t = mysqli_fetch_assoc($tab3)): ?>
                <tr>
                    <td style="width:35px;"><?=$t['codigo']?></td>
                    <?Php
                    $unidades = $t['cantidad'];
                    // Verifica si el número tiene decimales
                    if (floor($unidades) == $unidades){
                        // Si no tiene decimales, muestra el número sin decimales
                        $cantidad = number_format($unidades, 0);
                    }else{
                        // Si tiene decimales, muestra el número con dos decimales
                        $cantidad = number_format($unidades, 2);
                    }
                    ?>
                    <td style="width:22px;"><b><?=$cantidad?></b></td>
                    <td style="width:100px;"><?=$t['marca']?> <?=$t['nombre']?> <?=$t['medida']?></td>
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
                    <td style="text-align: right; font-size: 12px;" colspan="5"><b>TOTAL A PAGAR: S/.<?=$t1->total?> </b></td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                <td colspan="5">&nbsp;<b>OBS: <?=$t1->descripcion?></b></td>
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