<h1>Listado de Proveedores</h1>

<form action="<?=base_url?>proveedor/filtro" method="POST" enctype="multipart/form-data">
    <table style="width: 75%; text-align: left; border: none;">
        <tr>
            <th style="width:200px;">
                <label class="frm" style="margin-left:10%;" for="numruc">N° RUC</label>
                <input style="margin-left:10%; width:180px;" type="number"  name="numruc" class="fildt"/>
            </th>
            <th style="width:250px;">
                <label class="frm" style="margin-left:10%;" for="nombrecom">Proveedor</label>
                <input style="margin-left:10%; width:300px;" type="text"  name="nombrecom" class="fildt"/>
            </th>
            <th>
                <div class="fila-2" style="margin-right: 13%; margin-top: 30px;">
                    <input type="submit" value="Buscar" class="button solid-colort">
                </div>
            </th>
        </tr>
    </table>
</form>

<br>

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
        <th>ID</th>
        <th>N° RUC</th>
        <th>NOMBRE COMPLETO</th>
        <th>DIRECCIÓN</th>
        <th>CIUDAD</th>
        <th>N° CELULAR</th>
        <?Php if(isset($_SESSION['admin'])): ?>
        <th style="width: 120px;">ACCIONES</th>
        <?Php endif;?>
    </tr>
    <?Php while($pv = $prove->fetch_object()): ?>
    <tr>
        <td><?=$pv->id?></td>
        <td><?=$pv->numruc?></td>
        <td><?=$pv->nombrecom?></td>
        <td><?=$pv->direccion?></td>
        <td><?=$pv->ciudad?></td>
        <td><?=$pv->numcel?></td>
        <?Php if(isset($_SESSION['admin'])): ?>
        <td style="width: 120px;">
            <a href="<?=base_url?>proveedor/editar&id=<?=$pv->id?>" class="button solid-colort">Editar</a>
            <a href="<?=base_url?>proveedor/eliminar&id=<?=$pv->id?>" class="button extra-colort">Eliminar</a>
        </td>
        <?Php endif;?>
    </tr>
    <?Php endwhile; ?>
</table>
<table>
    <tr>
        <!--Paginador-->
        <td class="text-center" colspan="11">
        <?Php if(isset($totalPag)): ?>
            <?Php for($i=1; $i<=$totalPag; $i++): ?>
                <a href="<?=base_url?>proveedor/gestion&pag=<?=$i?>"><?=$i?></a> -
            <?Php endfor; ?>
        <?Php endif; ?>
        </td>
    </tr>
</table>