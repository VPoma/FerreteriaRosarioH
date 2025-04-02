<?Php
$id = $_GET['id'];
$fecha = $_GET['fecha'];
$turno = $_GET['turno'];
date_default_timezone_set("America/Lima");
$fecha_hora_ac = date('d/m/Y - g:i a');

$db = new mysqli('localhost', 'root', '', 'ferr_ros_h');
mysqli_query($db,"SET NAMES 'utf8'");

$tab1 = mysqli_query($db, "SELECT ar.*, u.usuariof as 'usuario' FROM arqueo ar "
                                        . "INNER JOIN usuario u ON ar.id_usuario = u.id "
                                        . "WHERE ar.id = $id;");
$t1 = $tab1->fetch_object();

if($turno != "CIERRE"){
    $tab2 = mysqli_query($db, "SELECT i.id, i.tipopago, i.ingresos, i.deudas, i.fecha, i.turno, i.descripcion, t.nombre as 'tienda', c.nombrecom as 'cliente', cu.id_cua as 'cuaderno', u.usuariof as 'usuario' FROM ingreso i "
                . "INNER JOIN tienda t on t.id = i.id_tienda "
                . "LEFT JOIN usuario u on u.id = i.id_usuario "
                . "LEFT JOIN cliente c on c.id = i.id_cliente "
                . "LEFT JOIN cuaderno cu on cu.id = i.id_cuaderno "
                . "WHERE i.fecha = '$fecha' AND i.turno = '$turno' AND i.est = 'H' ORDER BY id ASC;");
    
    $tab3 = mysqli_query($db, "SELECT e.id, e.descripcion, e.monto, e.fecha, e.turno, e.tipopago, t.nombre as 'tienda', u.usuariof as 'usuario' FROM egreso e "
                . "INNER JOIN tienda t on t.id = e.id_tienda "
                . "INNER JOIN usuario u on u.id = e.id_usuario "
                . "WHERE e.fecha = '$fecha' AND e.turno = '$turno' AND e.est = 'H' ORDER BY id ASC;");
}else{
    $tab2 = mysqli_query($db, "SELECT i.id, i.tipopago, i.ingresos, i.deudas, i.fecha, i.turno, i.descripcion, t.nombre as 'tienda', c.nombrecom as 'cliente', cu.id_cua as 'cuaderno', u.usuariof as 'usuario' FROM ingreso i "
                . "INNER JOIN tienda t on t.id = i.id_tienda "
                . "LEFT JOIN usuario u on u.id = i.id_usuario "
                . "LEFT JOIN cliente c on c.id = i.id_cliente "
                . "LEFT JOIN cuaderno cu on cu.id = i.id_cuaderno "
                . "WHERE i.fecha = '$fecha' AND i.est = 'H' ORDER BY id ASC;");

    $tab3 = mysqli_query($db, "SELECT e.id, e.descripcion, e.monto, e.fecha, e.turno, e.tipopago, t.nombre as 'tienda', u.usuariof as 'usuario' FROM egreso e "
                . "INNER JOIN tienda t on t.id = e.id_tienda "
                . "INNER JOIN usuario u on u.id = e.id_usuario "
                . "WHERE e.fecha = '$fecha' AND e.est = 'H' ORDER BY id ASC;");
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

            .imgcabe{
                width: 500px;
                height: 150px;
            }

            h2{
                text-align: center;
                color: #d62a2a;
            }

            h3{
                text-align: center;
                color: #d62a2a;
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

            .datoclie .cent{
                text-align: center;
            }

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

            <h2>ARQUEO DE FECHA <?=$fecha?></h2>
            <h2 style="margin-top: -5px;">TURNO <?=$turno?></h2>

            <h3>Ingresos</h3>
            <table class="tablita">
            <!--<table border="1" style="margin-left: -10px;">-->
                <tr>
                    <th style="width: 20px; text-align:center;">ID</th>
                    <th style="width: 75px; text-align:center;">TIENDA</th>
                    <th style="width: 100px; text-align:center;">DESCRIPCIÓN</th>
                    <th style="width: 100px; text-align:center;">PERSONA</th>
                    <th style="width: 70px; text-align:center;">T. PAGO</th>
                    <th style="width: 70px; text-align:center;">INGRESOS</th>
                    <th style="width: 60px; text-align:center;">DEUDAS</th>
                    <th style="width: 60px; text-align:center;">TURNO</th>
                    <th style="width: 100px; text-align:center;">FIRMA</th>
                </tr>
                <?Php while($t2 = mysqli_fetch_assoc($tab2)): ?>
                <tr>
                    <td style="width: 20px;"><?=$t2['id']?></td>
                    <td style="width: 75px;"><?=$t2['tienda']?></td>
                    <?Php
                    if(isset($t2['cuaderno'])){
                        $descripcion = 'N. V :'.$t2['cuaderno'];
                    }else{
                        $descripcion = $t2['descripcion'];
                    }
                    ?>
                    <td style="width: 100px;"><?=$descripcion?></td>
                    <?Php
                    if(isset($t2['cliente'])){
                        $persona = 'C: '.$t2['cliente'];
                    }else{
                        $persona = 'U: '.$t2['usuario'];
                    }
                    ?>
                    <td style="width: 100px; text-align:center;"><?=$persona?></td>
                    <td style="width: 70px;"><?=$t2['tipopago']?></td>
                    <td style="width: 70px; text-align:center;"><?=$t2['ingresos']?></td>
                    <td style="width: 60px; text-align:center;"><?=$t2['deudas']?></td>
                    <td style="width: 60px;"><?=$t2['turno']?></td>
                    <td style="width: 100px; padding-top: 15px;">___________</td>
                </tr>
                <?Php endwhile; ?>
            </table>

            <h3>Egresos</h3>
            <!--<table border="1" style="margin-left: 15px;">-->
            <table class="tablita" style="margin-left: 30px;">
                <tr>
                    <th style="width: 20px; text-align:center;">ID</th>
                    <th style="width: 75px; text-align:center;">TIENDA</th>
                    <th style="width: 180px; text-align:center;">DESCRIPCIÓN</th>
                    <th style="width: 75px; text-align:center;">T. PAGO</th>
                    <th style="width: 70px; text-align:center;">MONTO</th>
                    <th style="width: 70px; text-align:center;">USUARIO</th>
                    <th style="width: 65px; text-align:center;">TURNO</th>
                    <th style="width: 70px; text-align:center;">FECHA</th>
                </tr>
                <?Php while($t3 = mysqli_fetch_assoc($tab3)): ?>
                <tr>
                    <td style="width: 20px;"><?=$t3['id']?></td>
                    <td style="width: 75px;"><?=$t3['tienda']?></td>
                    <td style="width: 180px;"><?=$t3['descripcion']?></td>
                    <td style="width: 75px;"><?=$t3['tipopago']?></td>
                    <td style="width: 70px; text-align:center;"><?=$t3['monto']?></td>
                    <td style="width: 70px; text-align:center;"><?=$t3['usuario']?></td>
                    <td style="width: 65px;"><?=$t3['turno']?></td>
                    <td style="width: 70px;"><?=$t3['fecha']?></td>
                </tr>
                <?Php endwhile; ?>
            </table>

            <br>

            <h3>Totales de Arqueo</h3>

            <!--<table border="1" style="margin-left: 15px;">-->
            <table class="tablita" style="margin-left: 30px;">
                <tr>
                    <th style="width:135px; text-align:center;">Total de Ingresos Efectivo</th>
                    <th style="width:135px; text-align:center;">Total de Ingresos Transferencia</th>
                    <th style="width:135px; text-align:center;">Total de Egresos Efectivo</th>
                    <th style="width:135px; text-align:center;">Total de Egresos Transferencia</th>
                    <th style="width:135px; text-align:center;">Total de Deudas de Turno</th>
                </tr>
                <tr>
                    <td style="text-align:center;"><?=$t1->totalingresoe?></td>
                    <td style="text-align:center;"><?=$t1->totalingresot?></td>
                    <td style="text-align:center;"><?=$t1->totalegresoe?></td>
                    <td style="text-align:center;"><?=$t1->totalegresot?></td>
                    <td style="text-align:center;"><?=$t1->totaldeuda?></td>
                </tr>
                <tr>
                    <th colspan="2">Total de Transferencia</th>
                    <th colspan="3">Total de Efectivo (Caja)</th>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center;"><?=$t1->totaltransfer?></td>
                    <td colspan="3" style="text-align:center;"><?=$t1->totalefectivo?></td>
                </tr>
            </table>
        </div>
    </body>
</html>