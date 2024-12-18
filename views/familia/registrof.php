<?Php if(isset($edit) && isset($fam) && is_object($fam)):?>
    <h1>Editar Familia de Producto: <?=$fam->nombre?></h1>
    <?Php $url_action = base_url."familia/save&id=".$fam->id;?>
<?Php else:?>
    <h1>Crear Nueva Familia de Producto</h1>
    <?Php $url_action = base_url."familia/save";?>
<?Php endif;?>

    <form action="<?=$url_action?>" method="POST" enctype="multipart/form-data">

        <label class="frm" for="nombre">Nombre</label>
        <input type="text" name="nombre" value="<?=isset($fam) && is_object($fam) ? $fam->nombre : ''; ?>" required/>
        
        <input type="submit" value="Guardar">

        <div class="fila-2">
            <a href="<?=base_url?>familia/gestion" class="button extrae-colort">
                Regresar
            </a>
        </div>

    </form>