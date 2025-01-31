<h1>DETALLE ARQUEO N° <?=$arq->id?></h1>

<?Php if(isset($arq)):?>
<h3>Resumen de Arqueo</h3>
    <table>
        <tr>
            <th>Total de Ingresos Efectivo</th>
            <th>Total de Ingresos Transferencia</th>
            <th>Total de Egresos Efectivo</th>
            <th>Total de Egresos Transferencia</th>
            <th>Total de Deudas</th>
        </tr>
        <tr>
            <td><?=$arq->totalingresoe?></td>
            <td><?=$arq->totalingresot?></td>
            <td><?=$arq->totalegresoe?></td>
            <td><?=$arq->totalegresot?></td>
            <td><?=$arq->totaldeuda?></td>
        </tr>
        <tr>
            <th colspan="2">Total de Transferencia</th>
            <th colspan="3">Total de Efectivo (Caja)</th>
        </tr>
        <tr>
            <td colspan="2"><?=$arq->totaltransfer?></td>
            <td colspan="3"><?=$arq->totalefectivo?></td>
        </tr>
    </table>
<br>
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
<br>
    <div class="fila-1">
    
        <?Php if(isset($_SESSION['admin'])): ?>
            <a href="<?=base_url?>arqueo/eliminar&id=<?=$arq->id?>" class="button extrae-colort">Anular</a>
        <?Php endif;?>

    </div>
    
<?Php endif; ?>
    <br><br>

<a href="<?=base_url?>arqueo/gestion" class="button extrae-colort" style="margin-left: 6%">Regresar</a>