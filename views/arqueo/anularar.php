<?Php if(isset($delete) && isset($arq) && is_object($arq)):?>
    <h1>Anular Arqueo N° <?=$arq->id?></h1>
    <?Php $url_action = base_url."arqueo/delete&id=".$arq->id;?>
<?Php else:?>
    <?Php require_once 'views/arqueo/gestionar.php'; ?>
<?Php endif;?>

<h2>¿Esta seguro que desea Anular este Arqueo?</h2>

<br>

<div class="fila-1">
    <a href="<?=base_url?>arqueo/gestion" class="button extrae-colort">NO</a>    
    
    <a href="<?=$url_action?>" class="button solide-colort">SI</a>
</div>