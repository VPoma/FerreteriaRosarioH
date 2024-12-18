<?Php if(isset($delete) && isset($ciu) && is_object($ciu)):?>
    <h1>Ciudad: <?=$ciu->nombre?></h1>
    <?Php $url_action = base_url."ciudad/delete&id=".$ciu->id;?>
<?Php else:?>
    <?Php require_once 'views/ciudad/gestionc.php'; ?>
<?Php endif;?>

<h2>¿Esta seguro que desea eliminar esta ciudad?</h2>

<br>

<div class="fila-1">
    <a href="<?=$url_action?>" class="button solide-colort">
        SI
    </a>

    <a href="<?=base_url?>ciudad/gestion" class="button extrae-colort">
        NO
    </a>
</div>