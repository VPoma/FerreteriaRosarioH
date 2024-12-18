<?Php if(isset($delete) && isset($fam) && is_object($fam)):?>
    <h1>Familia de Productos: <?=$fam->nombre?></h1>
    <?Php $url_action = base_url."familia/delete&id=".$fam->id;?>
<?Php else:?>
    <?Php require_once 'views/familia/gestionf.php'; ?>
<?Php endif;?>

<h2>¿Esta seguro que desea eliminar esta Familia de Producto?</h2>

<br>

<div class="fila-1">
    <a href="<?=$url_action?>" class="button solide-colort">
        SI
    </a>

    <a href="<?=base_url?>familia/gestion" class="button extrae-colort">
        NO
    </a>
</div>