<h1>Listado de Tiendas</h1>

<!--
<a href="<?//=base_url?>usuario/registro" class="button solid-color">
    Agregar Nuevo
</a>
-->

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
<br>

<table class="tablita">
    <tr>
        <th style="width: 40px;">ID</th>
        <th style="width: 40px;">CIUDAD</th>
        <th style="width: 90px;">NOMBRE</th>
        <th style="width: 90px;">APELLIDOS</th>
        <th style="width: 40px;">ACCIONES</th>
    </tr>
    <?Php while($ti = $tien->fetch_object()): ?>
    <tr>
        <td style="width: 40px;"><?=$ti->id?></td>
        <td style="width: 40px;"><?=$ti->id_ciudad?></td>
        <td style="width: 90px;"><?=$ti->nombre?></td>
        <td style="width: 90px;"><?=$ti->direccion?></td>
        <td style="width: 40px;">
            <a href="<?=base_url?>tienda/editar&id=<?=$ti->id?>" class="button solid-colort">Editar</a>
            <a href="<?=base_url?>tienda/eliminar&id=<?=$ti->id?>" class="button extra-colort">Eliminar</a>
        </td>
    </tr>
    <?Php endwhile; ?>
</table>