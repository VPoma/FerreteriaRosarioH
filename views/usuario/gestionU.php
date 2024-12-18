<h1>Listado de Usuarios</h1>

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
        <th style="width: 40px;">DNI</th>
        <th style="width: 90px;">NOMBRE</th>
        <th style="width: 90px;">APELLIDOS</th>
        <th style="width: 70px;">USUARIO</th>
        <th style="width: 40px;">ACCIONES</th>
    </tr>
    <?Php while($us = $user->fetch_object()): ?>
    <tr>
        <td style="width: 40px;"><?=$us->id?></td>
        <td style="width: 40px;"><?=$us->dni?></td>
        <td style="width: 90px;"><?=$us->nombre?></td>
        <td style="width: 90px;"><?=$us->apellidos?></td>
        <td style="width: 70px;"><?=$us->usuariof?></td>
        <td style="width: 40px;">
            <a href="<?=base_url?>usuario/editar&id=<?=$us->id?>" class="button solid-colort">Editar</a>
            <a href="<?=base_url?>usuario/eliminar&id=<?=$us->id?>" class="button extra-colort">Eliminar</a>
        </td>
    </tr>
    <?Php endwhile; ?>
</table>