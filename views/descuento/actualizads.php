<?Php if(isset($edit) && isset($des) && is_object($des)):?>
    <h1>Actualiza Descuento</h1>
    <?Php $url_action = base_url."descuento/edita&id=".$des->id;?>

    <form action="<?=$url_action?>" method="POST" enctype="multipart/form-data">

        <label class="frm" for="porcentaje">Porcentaje</label>
        <input type="text" name="porcentaje" value="<?=isset($des) && is_object($des) ? $des->porcentaje : ''; ?>" required/>
        
        <input type="submit" value="Guardar">

        <div class="fila-2">
            <a href="<?=base_url?>descuento/gestion" class="button extrae-colort">
                Regresar
            </a>
        </div>

    </form>

<?Php endif;?>