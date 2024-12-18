<?Php if(isset($delete) && isset($tip) && is_object($tip)):?>
    <h1>Tipo de Documento: <?=$tip->documento?></h1>
    <?Php $url_action = base_url."tipodoc/delete&id=".$tip->id;?>
<?Php else:?>
    <?Php require_once 'views/tipodoc/gestiontd.php'; ?>
<?Php endif;?>

<h2>¿Esta seguro que desea eliminar este tipo de documento?</h2>

<br>

<div class="fila-1">
    <a href="<?=$url_action?>" class="button solide-colort">
        SI
    </a>

    <a href="<?=base_url?>tipodoc/gestion" class="button extrae-colort">
        NO
    </a>
</div>