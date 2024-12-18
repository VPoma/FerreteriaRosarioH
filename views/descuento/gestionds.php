<h1>Descuento</h1>

<?Php if(isset($_SESSION['register']) && $_SESSION['register'] == 'complete'): ?>
    <strong class="alert_green">Registro modificado Correctamente</strong>
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
        <th style="width: 90px;">PORCENTAJE</th>
        <th style="width: 40px;">ACCIONES</th>
    </tr>
    <?Php while($de = $desc->fetch_object()): ?>
    <tr>
        <td style="width: 40px;"><?=$de->id?></td>
        <td style="width: 90px;"><?=$de->porcentaje?></td>
        <td style="width: 40px;">
            <a href="<?=base_url?>descuento/editar&id=<?=$de->id?>" class="button solid-colort">Editar</a>
        </td>
    </tr>
    <?Php endwhile; ?>
</table>