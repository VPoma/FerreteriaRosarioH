<h1>Arqueo de Caja</h1>

<table class="tablita" style="margin-left:10%;">
    <tr>
        <th colspan="9" style="font-size: 20px;">INGRESOS</th>
    </tr>
    <tr>
        <th style="width: 20px;">ID</th>
        <th style="width: 60px;">TIENDA</th>
        <th style="width: 20px;">CUADERNO</th>
        <th style="width: 60px;">TIPO DE PAGO</th>
        <th style="width: 50px;">INGRESOS</th>
        <th style="width: 50px;">DEUDAS</th>
        <th style="width: 70px;">CLIENTE</th>
        <th style="width: 50px;">TURNO</th>
        <th style="width: 75px;">FECHA</th>
    </tr>
    <?Php while($in = $ingr->fetch_object()): ?>
    <tr>
        <td style="width: 20px;"><?=$in->id?></td>
        <td style="width: 60px;"><?=$in->tienda?></td>
        <td style="width: 20px;"><?=$in->cuaderno?></td>
        <td style="width: 60px;"><?=$in->tipopago?></td>
        <td style="width: 50px;"><?=$in->ingresos?></td>
        <td style="width: 50px;"><?=$in->deudas?></td>
        <td style="width: 70px;"><?=$in->cliente?></td>
        <td style="width: 50px;"><?=$in->turno?></td>
        <td style="width: 75px;"><?=$in->fecha?></td>
    </tr>
    <?Php endwhile; ?>
</table>
<table>
    <tr>
        <th>Total de Ingresos Efectivo</th>
        <th>Total de Ingresos Transferencia</th>
        <th>Total de Deudas</th>
    </tr>
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
    ?>
    <tr>
        <td><?=$inef?></td>
        <td><?=$intr?></td>
        <td><?=$inde?></td>
    </tr>
</table>

<br>

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
<table>
    <tr>
        <th>Total de Egresos Efectivo</th>
        <th>Total de Egresos Transferencia</th>
    </tr>
    <?Php
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
    <tr>
        <td><?=$monef?></td>
        <td><?=$montr?></td>
    </tr>
</table>
<?Php
    $resto = $inef - $monef;
?>
<h3 style="margin-right: 3%;">Resto en Caja: <?=$resto?></h3>