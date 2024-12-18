<h1>Gestión de Precios de Fierro Soles</h1>

<form action="<?=base_url?>precio/delete" method="POST" enctype="multipart/form-data">
    <table style="width: 75%; text-align: left; border: none;">
        <tr>
            <th style="width:250px;">
                <label class="frm" style="margin-left:10%;" for="tipocam">Eliminar Precios por Fecha</label>
                <input class="frm" style="margin-left:10%; margin-top:-4%; width:200px;" type="date"  name="fecha" class="fildt"/>
            </th>
            <th style="width:250px;">
                <label class="frm" for="marca">Marca de Producto</label>
                <?Php $marcas = utils::showMarcaFi(); ?>
                    <select name="marca" id="">
                        <?Php while($mar = $marcas->fetch_object()): ?>
                            <option value="<?=$mar->id?>">
                                <?=$mar->nombre?>
                            </option>
                        <?Php endwhile; ?>
                    </select>
            </th>
            <th>
                <div class="fila-2" style="margin-right: 13%; margin-top: 30px;">
                    <input type="submit" value="Eliminar" class="button extrae-colort">
                </div>
            </th>
        </tr>
    </table>
</form>

<br><br>

<?Php if(isset($_SESSION['register']) && $_SESSION['register'] == 'complete'): ?>
    <strong class="alert_green">Registro ingresado/modificado Correctamente</strong>
<?Php elseif(isset($_SESSION['register']) && $_SESSION['register'] != 'complete'): ?>
    <strong class="alert_red">Error: Introduce bien los datos</strong>
<?Php endif; ?>
<?Php Utils::deleteSession('register');?>

<?Php if(isset($_SESSION['delete']) && $_SESSION['delete'] == 'complete'): ?>
    <strong class="alert_green">Registro Eliminado correctamente</strong>
<?Php elseif(isset($_SESSION['delete']) && $_SESSION['delete'] != 'complete'): ?>
    <strong class="alert_red">Error: Registro No Eliminado</strong>
<?Php endif; ?>
<?Php Utils::deleteSession('delete');?>

<table class="tablita">
    <tr>
        <th style="width: 90px;">FECHA</th>
        <th style="width: 40px;">MARCA</th>
        <th style="width: 40px;">PRODUCTO</th>
        <th style="width: 40px;">MEDIDA</th>
        <th style="width: 40px;">DOLAR</th>
        <th style="width: 40px;">T.BASE</th>
        <th style="width: 40px;">T.FERR</th>
        <th style="width: 40px;">T.COST</th>
        <th style="width: 40px;">P.BASE</th>
        <th style="width: 40px;">P.FERR</th>
        <th style="width: 40px;">P.COST</th>
    </tr>
    <?Php while($pr = $prec->fetch_object()): ?>
    <tr>
        <td style="width: 90px;"><?=$pr->fecha?></td>
        <td style="width: 40px;"><?=$pr->marca?></td>
        <td style="width: 40px;"><?=$pr->nombre?></td>
        <td style="width: 40px;"><?=$pr->medida?></td>
        <td style="width: 40px;"><?=number_format($pr->tipocam,3)?></td>
        <td style="width: 40px;"><?=$pr->toneladab?></td>
        <td style="width: 40px;"><?=$pr->toneladaf?></td>
        <td style="width: 40px;"><?=$pr->toneladac?></td>
        <td style="width: 40px;"><?=$pr->preciob?></td>
        <td style="width: 40px;"><?=$pr->preciof?></td>
        <td style="width: 40px;"><?=$pr->precioc?></td>        
    </tr>
    <?Php endwhile; ?>
</table>