<?Php if(isset($delete) && isset($ing) && is_object($ing)):?>
    <h1>Ingreso: <?=$ing->descripcion?></h1>
    <h2>Monto: <?=$ing->ingresos?></h2>
    <?Php $url_action = base_url."ingreso/delete&id=".$ing->id;?>
<?Php else:?>
    <?Php require_once 'views/ingreso/gestionin.php'; ?>
<?Php endif;?>

<h2>¿Esta seguro que desea eliminar este Ingreso?</h2>

<br>

<div class="fila-1">
    <a href="<?=$url_action?>" class="button solide-colort">
        SI
    </a>

    <a href="<?=base_url?>ingreso/gestion" class="button extrae-colort">
        NO
    </a>
</div>