<h1>Gestión de Productos</h1>

<!--
<a href="<?//=base_url?>usuario/registro" class="button solid-color">
    Agregar Nuevo
</a>
-->

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
        <th style="width: 40px;">ID</th>
        <th style="width: 40px;">TIENDA</th>
        <th style="width: 40px;">FAMILIA</th>
        <th style="width: 90px;">LINEA</th>
        <th style="width: 90px;">MARCA</th>
        <th style="width: 70px;">NOMBRE</th>
        <th style="width: 70px;">MEDIDA</th>
        <th style="width: 40px;">CANTIDAD</th>
        <th style="width: 40px;">ACCIONES</th>
    </tr>
    <?Php while($pr = $prod->fetch_object()): ?>
    <tr>
        <td style="width: 40px;"><?=$pr->id?></td>
        <td style="width: 40px;"><?=$pr->tienda?></td>
        <td style="width: 90px;"><?=$pr->familia?></td>
        <td style="width: 90px;"><?=$pr->linea?></td>
        <td style="width: 70px;"><?=$pr->marca?></td>
        <td style="width: 70px;"><?=$pr->nombre?></td>
        <td style="width: 70px;"><?=$pr->medida?></td>
        <td style="width: 70px;"><?=$pr->cantidad?></td>
        <td style="width: 40px;">
            <a href="<?=base_url?>producto/editar&id=<?=$pr->id?>" class="button solid-colort">Editar</a>
            <a href="<?=base_url?>producto/eliminar&id=<?=$pr->id?>" class="button extra-colort">Eliminar</a>
        </td>
    </tr>
    <?Php endwhile; ?>
</table>