<?Php if(isset($delete) && isset($pro) && is_object($pro)):?>
    <h1>Producto: <?=$pro->nombre?></h1>
    <?Php $url_action = base_url."producto/delete&id=".$pro->id;?>
<?Php else:?>
    <?Php require_once 'views/producto/gestionpr.php'; ?>
<?Php endif;?>

<h2>¿Esta seguro que desea eliminar este Producto?</h2>

<br>

<div class="fila-1">
    <a href="<?=$url_action?>" class="button solide-colort">
        SI
    </a>

    <a href="<?=base_url?>producto/gestion" class="button extrae-colort">
        NO
    </a>
</div>