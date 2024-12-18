<?Php if(isset($delete) && isset($pvd) && is_object($pvd)):?>
    <h1>Proveedor: <?=$pvd->nombrecom?></h1>
    <?Php $url_action = base_url."proveedor/delete&id=".$pvd->id;?>
<?Php else:?>
    <?Php require_once 'views/proveedor/gestionpv.php'; ?>
<?Php endif;?>

<h2>¿Esta seguro que desea eliminar este Proveedor?</h2>

<br>

<div class="fila-1">
    <a href="<?=$url_action?>" class="button solide-colort">
        SI
    </a>

    <a href="<?=base_url?>proveedor/gestion" class="button extrae-colort">
        NO
    </a>
</div>