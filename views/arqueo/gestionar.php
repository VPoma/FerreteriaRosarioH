<h1>Registro de Arqueo de Caja de Chica</h1>

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
        <th style="width: 70px;">Fecha</th>
        <th style="width: 60px;">Turno</th>

        <th style="width: 50px;">Monto Inicial C.</th>
        <th style="width: 50px;">Total Ingreso E.</th>
        <th style="width: 50px;">Total Egreso E.</th>
        <th style="width: 50px;">Total Deuda</th>
        <th style="width: 50px;">Total Efectivo</th>
        <th style="width: 50px;">Total En Caja</th>
        <th style="width: 60px;">Usuario</th>
        <th style="width: 80px;">Acciones</th>
    </tr>
    <?Php while($ar = $arqu->fetch_object()): ?>
    <tr>
        <td><?=$ar->id?></td>
        <td><?=$ar->fecha?></td>
        <td><?=$ar->turno?></td>
        <td><?=$ar->montoinicialc?></td>
        <td><?=$ar->totalingresoe?></td>
        <td><?=$ar->totalegresoe?></td>
        <td><?=$ar->totaldeuda?></td>
        <td><?=$ar->totalefectivo?></td>
        <td><?=$ar->totalcaja?></td>
        <td><?=$ar->usuario?></td>
        <td>
            <a href="<?=base_url?>egreso/eliminar&id=<?=$ar->id?>" class="button extra-colort">Eliminar</a>
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
                <a href="<?=base_url?>arqueo/gestion&pag=<?=$i?>"><?=$i?></a> -
            <?Php endfor; ?>
        <?Php endif; ?>
        </td>
    </tr>
</table>