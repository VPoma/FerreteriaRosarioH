<h1>Ciudades</h1>

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
        <th style="width: 50px;">ID</th>
        <th style="width: 300px;">NOMBRE</th>
        <th style="width: 50px;">ACCIONES</th>
    </tr>
    <?Php while($ci = $ciud->fetch_object()): ?>
    <tr>
        <td><?=$ci->id?></td>
        <td><?=$ci->nombre?></td>
        <td>
            <a href="<?=base_url?>ciudad/editar&id=<?=$ci->id?>" class="button solid-colort">Editar</a>
            <a href="<?=base_url?>ciudad/eliminar&id=<?=$ci->id?>" class="button extra-colort">Eliminar</a>
        </td>
    </tr>
    <?Php endwhile; ?>
</table>