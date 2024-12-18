<?Php if(isset($delete) && isset($usu) && is_object($usu)):?>
    <h1>Usuario: <?=$usu->nombre?> <?=$usu->apellidos?></h1>
    <?Php $url_action = base_url."usuario/delete&id=".$usu->id;?>
<?Php else:?>
    <?Php require_once 'views/usuario/gestionU.php'; ?>
<?Php endif;?>

<h2>¿Esta seguro que desea eliminar este Usuario?</h2>

<br>

<div class="fila-1">
    <a href="<?=$url_action?>" class="button solide-colort">
        SI
    </a>

    <a href="<?=base_url?>usuario/gestion" class="button extrae-colort">
        NO
    </a>
</div>