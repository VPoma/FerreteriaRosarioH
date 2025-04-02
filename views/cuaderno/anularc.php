<?Php if(isset($delete) && isset($cua) && is_object($cua)):?>
    <h1>Anular Venta N° <?=$cua->id_cua?></h1>
    <?Php $url_action = base_url."cuaderno/delete&id=".$cua->id;?>
<?Php else:?>
    <?Php require_once 'views/cuaderno/registrosc.php'; ?>
<?Php endif;?>

<h2>¿Esta seguro que desea Anular esta Venta?</h2>

<br>

<div class="fila-1">
    <a href="<?=base_url?>cuaderno/detalle&id=<?=$cua->id?>" class="button extrae-colort">NO</a>    
    
    <a href="<?=$url_action?>" class="button solide-colort">SI</a>
</div>