<?Php if(isset($edit) && isset($tip) && is_object($tip)):?>
    <h1>Editar Tipo de Documento: <?=$tip->documento?></h1>
    <?Php $url_action = base_url."tipodoc/save&id=".$tip->id;?>
<?Php else:?>
    <h1>Crear Nuevo Tipo de Documento</h1>
    <?Php $url_action = base_url."tipodoc/save";?>
<?Php endif;?>

    <form action="<?=$url_action?>" method="POST" enctype="multipart/form-data">

        <label class="frm" for="documento">Documento</label>
        <input type="text" name="documento" value="<?=isset($tip) && is_object($tip) ? $tip->documento : ''; ?>" required/>
        
        <input type="submit" value="Guardar">

        <div class="fila-2">
            <a href="<?=base_url?>tipodoc/gestion" class="button extrae-colort">
                Regresar
            </a>
        </div>

    </form>