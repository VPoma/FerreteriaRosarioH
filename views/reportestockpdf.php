<?Php
$id_producto = $_GET['id'];
date_default_timezone_set("America/Lima");
$fecha_hora_ac = date('d/m/Y - g:i a');

$db = new mysqli('localhost', 'root', '', 'ferr_ros_h');
mysqli_query($db,"SET NAMES 'utf8'");

$tab1 = mysqli_query($db, "SELECT p.id, p.codigo ,p.nombre, p.medida, p.preciob, p.preciof, p.precioc, p.cantidad, l.nombre as 'linea', m.nombre as 'marca', f.nombre as 'familia' "
                            . "FROM producto p "
                            . "INNER JOIN familia f ON f.id= p.id_familia "
                            . "INNER JOIN linea l ON l.id = p.id_linea "
                            . "INNER JOIN marca m ON m.id = p.id_marca "
                            . "WHERE p.id = $id_producto ORDER BY id DESC;");
$t1 = $tab1->fetch_object();


$tab2 = mysqli_query($db, "SELECT cu.id as 'id', cu.fecha as 'fechareg', cu.fecha_sal as 'fecha', 'cuaderno' AS 'fuente', pc.cantidad as 'cantidad' "
                            . "FROM producto_cuaderno pc "
                            . "INNER JOIN cuaderno cu ON cu.id = pc.id_cuaderno "
                            . "INNER JOIN producto p ON p.id = pc.id_producto "
                            . "INNER JOIN familia fa ON fa.id = p.id_familia "
                            . "INNER JOIN linea li ON li.id = p.id_linea "
                            . "INNER JOIN marca ca ON ca.id = p.id_marca "
                            . "WHERE pc.id_producto = $id_producto AND pc.est = 'H' "
                            . "UNION "
                            . "SELECT ab.id as 'id', ab.fecha as 'fechareg', ab.fecha_ent as 'fecha', 'abastecer' AS 'fuente', pa.cantidad as 'cantidad' "
                            . "FROM producto_abastecer pa "
                            . "INNER JOIN abastecer ab ON ab.id = pa.id_abastecer "
                            . "INNER JOIN producto p ON p.id = pa.id_producto "
                            . "INNER JOIN familia fa ON fa.id = p.id_familia "
                            . "INNER JOIN linea li ON li.id = p.id_linea "
                            . "INNER JOIN marca ca ON ca.id = p.id_marca "
                            . "WHERE pa.id_producto = $id_producto AND pa.est = 'H' "
                            . "ORDER BY fecha DESC;");
?>
<!DOCTYPE html>
<html lang="en">
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
                    <th style="width: 250px;">AV. Calle Real N° 123</th>
                </tr>
                <tr>
                    <th style="width: 250px;">RUC: 10712327311</th>
                </tr>
            </table>
            <br>
            <table class="numtik">
                <tr>
                    <th style="width: 250px;">HISTORIAL DE PRODUCTO</th>
                </tr>
                <tr>
                    <th style="width: 250px;">00000<?=$id_producto?></th>
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
                <td><b>Codigo: </b></td>
                <td>&nbsp;<?=$t1->codigo?></td>
            </tr>
            <tr>
                <td><b>Familia: </b></td>
                <td>&nbsp;<?=$t1->familia?></td>
            </tr>
            <tr>
                <td><b>Linea: </b></td>
                <td>&nbsp;<?=$t1->linea?></td>
            </tr>
            <tr>
                <td><b>Marca: </b></td>
                <td>&nbsp;<?=$t1->marca?></td>
            </tr>
            <tr>
                <td><b>Producto: </b></td>
                <td>&nbsp;<?=$t1->nombre?></td>
            </tr>
            <tr>
                <td><b>Medida:</b></td>
                <td>&nbsp;<?=$t1->medida?></td>
            </tr>
        </table>

        <br>

            <table>
                <tr>
                    <th style="width: 15px;">Id</th>
                    <th style="width: 70px;">Registro</th>
                    <th style="width: 53px;">F. Registro</th>
                    <th style="width: 36px;">Estado</th>
                    <th style="width: 53px;">F. Estado</th>
                    <th style="width: 20px;">Unid</th>
                </tr>
                <?Php while($t = mysqli_fetch_assoc($tab2)): ?>
                <tr>
                    <td><?=$t['id']?></td>
                    <?Php
                    $fuente = $t['fuente'];
                    if($fuente == 'cuaderno'){
                        $cuabs = 'Reg. Cuaderno'; 
                    }else{
                        $cuabs = 'Abastecimiento';
                    }
                    ?>
                    <td><?=$cuabs?></td>
                    <td><?=$t['fechareg']?></td>
                    <?Php
                    $fuente = $t['fuente'];
                    if($fuente == 'cuaderno'){
                        $estado = 'Salió'; 
                    }else{
                        $estado = 'Ingresó';
                    }
                    ?>
                    <td><b><?=$estado?></b></td>
                    <?Php
                    if(isset($t['fecha'])){
                        $fecha = $t['fecha'];
                    }else{
                        $fecha = 'Aun Nó';
                    }
                    ?>
                    <td><b><?=$fecha?></b></td>
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
                    <td><b><?=$cantidad?></b></td>
                </tr>
                <?Php endwhile;?>
            </table>
    </div>
</body>
</html>