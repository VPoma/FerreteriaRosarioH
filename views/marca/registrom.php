<?Php if(isset($edit) && isset($mar) && is_object($mar)):?>
    <h1>Editar Marca de Producto: <?=$mar->nombre?></h1>
    <?Php $url_action = base_url."marca/save&id=".$mar->id;?>
<?Php else:?>
    <h1>Crear Nueva Marca de Producto</h1>
    <?Php $url_action = base_url."marca/save";?>
<?Php endif;?>

    <form action="<?=$url_action?>" method="POST" enctype="multipart/form-data">

        <label class="frm" for="nombre">Nombre</label>
        <input type="text" name="nombre" value="<?=isset($mar) && is_object($mar) ? $mar->nombre : ''; ?>" required/>
        
        <input type="submit" value="Guardar">

        <div class="fila-2">
            <a href="<?=base_url?>marca/gestion" class="button extrae-colort">
                Regresar
            </a>
        </div>

    </form>