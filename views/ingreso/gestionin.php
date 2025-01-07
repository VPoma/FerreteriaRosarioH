<h1>Ingresos de Caja Chica</h1>

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
        <th style="width: 20px;">ID</th>
        <th style="width: 60px;">TIENDA</th>
        <th style="width: 20px;">CUADERNO</th>
        <th style="width: 60px;">TIPO DE PAGO</th>
        <th style="width: 50px;">INGRESOS</th>
        <th style="width: 50px;">DEUDAS</th>
        <th style="width: 70px;">CLIENTE</th>
        <th style="width: 50px;">TURNO</th>
        <th style="width: 75px;">FECHA</th>
        <th style="width: 30px;">ACCIONES</th>
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
        <td style="width: 30px;">
            <a href="<?=base_url?>egreso/editar&id=<?=$in->id?>" class="button solid-colort">Editar</a>
            <a href="<?=base_url?>egreso/eliminar&id=<?=$in->id?>" class="button extra-colort">Eliminar</a>
        </td>
    </tr>
    <?Php endwhile; ?>
</table>
<table>
    <tr>
        <!--Paginador-->
        <td class="text-center" colspan="11">
        <?Php if(isset($totalPag)): ?>
            <?Php for($i=1; $i<=$totalPag; $i++): ?>
                <a href="<?=base_url?>ingreso/gestion&pag=<?=$i?>"><?=$i?></a> -
            <?Php endfor; ?>
        <?Php endif; ?>
        </td>
    </tr>
</table>