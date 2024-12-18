<?Php if(isset($delete) && isset($lin) && is_object($lin)):?>
    <h1>Linea de Productos: <?=$lin->nombre?></h1>
    <?Php $url_action = base_url."linea/delete&id=".$lin->id;?>
<?Php else:?>
    <?Php require_once 'views/linea/gestiont.php'; ?>
<?Php endif;?>

<h2>¿Esta seguro que desea eliminar esta Linea de Producto?</h2>

<br>

<div class="fila-1">
    <a href="<?=$url_action?>" class="button solide-colort">
        SI
    </a>

    <a href="<?=base_url?>linea/gestion" class="button extrae-colort">
        NO
    </a>
</div>