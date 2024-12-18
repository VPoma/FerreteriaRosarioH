<?Php if(isset($delete) && isset($abs) && is_object($abs)):?>
    <h1>Anular Abastecimiento N° <?=$abs->id?></h1>
    <?Php $url_action = base_url."abastecer/delete&id=".$abs->id;?>
<?Php else:?>
    <?Php require_once 'views/abastecer/registrosa.php'; ?>
<?Php endif;?>

<h2>¿Esta seguro que desea Anular este Abastecimiento?</h2>

<br>

<div class="fila-1">
    <a href="<?=base_url?>abastecer/detalle&id=<?=$abs->id?>" class="button extrae-colort">NO</a>    
    
    <a href="<?=$url_action?>" class="button solide-colort">SI</a>
</div>