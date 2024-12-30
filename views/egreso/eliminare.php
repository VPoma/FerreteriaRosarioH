<?Php if(isset($delete) && isset($egr) && is_object($egr)):?>
    <h1>Egreso: <?=$egr->descripcion?></h1>
    <h2>Monto: <?=$egr->monto?></h2>
    <?Php $url_action = base_url."egreso/delete&id=".$egr->id;?>
<?Php else:?>
    <?Php require_once 'views/egreso/gestione.php'; ?>
<?Php endif;?>

<h2>¿Esta seguro que desea eliminar este Egreso?</h2>

<br>

<div class="fila-1">
    <a href="<?=$url_action?>" class="button solide-colort">
        SI
    </a>

    <a href="<?=base_url?>egreso/gestion" class="button extrae-colort">
        NO
    </a>
</div>