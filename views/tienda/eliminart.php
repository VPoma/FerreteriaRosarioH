<?Php if(isset($delete) && isset($tie) && is_object($tie)):?>
    <h1>Tienda: <?=$tie->nombre?></h1>
    <?Php $url_action = base_url."tienda/delete&id=".$tie->id;?>
<?Php else:?>
    <?Php require_once 'views/tienda/gestiont.php'; ?>
<?Php endif;?>

<h2>¿Esta seguro que desea eliminar esta Tienda?</h2>

<br>

<div class="fila-1">
    <a href="<?=$url_action?>" class="button solide-colort">
        SI
    </a>

    <a href="<?=base_url?>tienda/gestion" class="button extrae-colort">
        NO
    </a>
</div>