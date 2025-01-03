<h1>Egresos de Caja Chica</h1>

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
        <th style="width: 150px;">DESCRIPCIÓN</th>
        <th style="width: 60px;">TIPO DE PAGO</th>
        <th style="width: 50px;">MONTO</th>
        <th style="width: 70px;">USUARIO</th>
        <th style="width: 50px;">TURNO</th>
        <th style="width: 65px;">FECHA</th>
        <th style="width: 30px;">ACCIONES</th>
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
        <td style="width: 30px;">
            <a href="<?=base_url?>egreso/editar&id=<?=$eg->id?>" class="button solid-colort">Editar</a>
            <a href="<?=base_url?>egreso/eliminar&id=<?=$eg->id?>" class="button extra-colort">Eliminar</a>
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
                <a href="<?=base_url?>egreso/gestion&pag=<?=$i?>"><?=$i?></a> -
            <?Php endfor; ?>
        <?Php endif; ?>
        </td>
    </tr>
</table>