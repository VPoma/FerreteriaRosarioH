<?Php if(isset($delete) && isset($mar) && is_object($mar)):?>
    <h1>Marca de Productos: <?=$mar->nombre?></h1>
    <?Php $url_action = base_url."marca/delete&id=".$mar->id;?>
<?Php else:?>
    <?Php require_once 'views/marca/gestiont.php'; ?>
<?Php endif;?>

<h2>¿Esta seguro que desea eliminar esta Marca de Producto?</h2>

<br>

<div class="fila-1">
    <a href="<?=$url_action?>" class="button solide-colort">
        SI
    </a>

    <a href="<?=base_url?>marca/gestion" class="button extrae-colort">
        NO
    </a>
</div>