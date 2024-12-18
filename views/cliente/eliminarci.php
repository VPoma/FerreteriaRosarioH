<?Php if(isset($delete) && isset($cli) && is_object($cli)):?>
    <h1>Cliente: <?=$cli->nombrecom?></h1>
    <?Php $url_action = base_url."cliente/delete&id=".$cli->id;?>
<?Php else:?>
    <?Php require_once 'views/cliente/gestionci.php'; ?>
<?Php endif;?>

<h2>¿Esta seguro que desea eliminar este Cliente?</h2>

<br>

<div class="fila-1">
    <a href="<?=$url_action?>" class="button solide-colort">
        SI
    </a>

    <a href="<?=base_url?>cliente/gestion" class="button extrae-colort">
        NO
    </a>
</div>