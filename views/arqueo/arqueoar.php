<h1>Arqueo de Caja de la <?=$turnoarqueo?></h1>

<table class="tablita" style="margin-left:10%;">
    <tr>
        <th colspan="9" style="font-size: 20px;">INGRESOS</th>
    </tr>
    <tr>
        <th style="width: 15px;">ID</th>
        <th style="width: 50px;">TIENDA</th>
        <th style="width: 60px;">DESCRIPCIÓN</th>
        <th style="width: 40px;">PERSONA</th>
        <th style="width: 40px;">TIPO DE PAGO</th>
        <th style="width: 40px;">INGRESOS</th>
        <th style="width: 40px;">DEUDAS</th>
        <th style="width: 50px;">TURNO</th>
        <th style="width: 75px;">FECHA</th>
    </tr>
    <?Php while($in = $ingr->fetch_object()): ?>
    <tr>
        <td><?=$in->id?></td>
        <td><?=$in->tienda?></td>
        <?Php
        if(isset($in->cuaderno)){
            $descripcion = "CUADERNO $in->cuaderno";
        }else{
            $descripcion = $in->descripcion;
        }
        ?>
        <td><?=$descripcion?></td>
        <?Php
        if(isset($in->cliente)){
            $persona = "Cliente: $in->cliente";
        }else{
            $persona = "Usuario: $in->usuario";
        }
        ?>
        <td><?=$persona?></td>
        <td><?=$in->tipopago?></td>
        <td><?=$in->ingresos?></td>
        <td><?=$in->deudas?></td>
        <td><?=$in->turno?></td>
        <td><?=$in->fecha?></td>
    </tr>
    <?Php endwhile; ?>
</table>
<table class="tablita" style="margin-left:10%;">
    <tr>
        <th colspan="9" style="font-size: 20px;">EGRESOS</th>
    </tr>
    <tr>
        <th style="width: 20px;">ID</th>
        <th style="width: 60px;">TIENDA</th>
        <th style="width: 150px;">DESCRIPCIÓN</th>
        <th style="width: 60px;">TIPO DE PAGO</th>
        <th style="width: 50px;">MONTO</th>
        <th style="width: 70px;">USUARIO</th>
        <th style="width: 50px;">TURNO</th>
        <th style="width: 65px;">FECHA</th>
    </tr>
    <?Php while($eg = $egre->fetch_object()): ?>
    <tr>
        <td style="width: 20px;"><?=$eg->id?></td>
        <td style="width: 60px;"><?=$eg->tienda?></td>
        <td style="width: 150px;"><?=$eg->descripcion?></td>
        <td style="width: 60px;"><?=$eg->tipopago?></td>
        <td style="width: 50px;"><?=$eg->monto?></td>
        <td style="width: 70px;"><?=$eg->usuario?></td>
        <td style="width: 50px;"><?=$eg->turno?></td>
        <td style="width: 65px;"><?=$eg->fecha?></td>
    </tr>
    <?Php endwhile; ?>
</table>
<table class="tablita" style="margin-left:10%;">
    <tr>
        <th colspan="9" style="font-size: 20px;">RESUMEN</th>
    </tr>
</table>
<?Php
    $inef=0;
    While($icef = $in_calef->fetch_object()){
        $ingreef = $icef->ingresos;
        $inef += $ingreef;
    }

    $intr=0;
    While($ictr = $in_caltr->fetch_object()){
        $ingretr = $ictr->ingresos;
        $intr += $ingretr;
    }

    $inde=0;
    While($icde = $in_calde->fetch_object()){
        $ingrede = $icde->deudas;
        $inde += $ingrede;
    }

    $monef=0;
    While($mef = $eg_calef->fetch_object()){
        $montoef = $mef->monto;
        $monef += $montoef;
    }

    $montr=0;
    While($mtr = $eg_caltr->fetch_object()){
        $montotr = $mtr->monto;
        $montr += $montotr;
    }
?>
<table>
    <tr>
        <th>Total de Ingresos Efectivo</th>
        <th>Total de Ingresos Transferencia</th>
        <th>Total de Egresos Efectivo</th>
        <th>Total de Egresos Transferencia</th>
        <th>Total de Deudas</th>
    </tr>
    <tr>
        <td><?=$inef?></td>
        <td><?=$intr?></td>
        <td><?=$monef?></td>
        <td><?=$montr?></td>
        <td><?=$inde?></td>
    </tr>
    <tr>
        <th colspan="2">Total de Transferencia</th>
        <th colspan="3">Total de Efectivo (Caja)</th>
    </tr>
    <tr>
        <td colspan="2"><?=$intr-$montr?></td>
        <td colspan="3"><?=$inef-$monef?></td>
    </tr>
</table>
<br>

<form action="<?=base_url?>arqueo/save" method="POST" enctype="multipart/form-data">
    <input type="hidden" name="usuario" value="<?=$_SESSION['identity']->id?>"/>
    <input type="hidden" name="totalingresoefectivo" value="<?=$inef?>" />
    <input type="hidden" name="totalingresotransfer" value="<?=$intr?>" />
    <input type="hidden" name="totalegresoefectivo" value="<?=$monef?>" />
    <input type="hidden" name="totalegresotransfer" value="<?=$montr?>" />
    <input type="hidden" name="totaldeuda" value="<?=$inde?>" />
    <input type="hidden" name="totalefectivo" value="<?=$inef-$monef?>" />
    <input type="hidden" name="totaltransfer" value="<?=$intr-$montr?>" />
    <input type="hidden" name="fechaar" value="<?=$fechaarqueo?>" />
    <input type="hidden" name="turno" value="<?=$turnoarqueo?>" />

    <div class="fila-2">
        <input type="submit" value="REALIZAR ARQUERO" class="button solide-colort" style="width:200px;">
    </div>
    <br>
    <p><a href="<?=base_url?>arqueo/index" class="button extrae-colort" style="margin-left: 2%">Regresar</a></p>

</Form>