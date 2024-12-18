<?Php if(isset($edit) && isset($tie) && is_object($tie)):?>
    <h1>Editar Tienda: <?=$tie->nombre?></h1>
    <?Php $url_action = base_url."tienda/save&id=".$tie->id;?>
<?Php else:?>
    <h1>Crear Nueva Tienda</h1>
    <?Php $url_action = base_url."tienda/save";?>
<?Php endif;?>

    <form action="<?=$url_action?>" method="POST" enctype="multipart/form-data">

        <label class="frm" for="ciudad">Ciudad</label>
        <?Php $ciudades = utils::showCiudad(); ?>
        <select name="ciudad" id="">
            <?Php while($ciu = $ciudades->fetch_object()): ?>
                <option value="<?=$ciu->id?>" <?=isset($tie) && is_object($tie) && $ciu->id == $tie->id_ciudad ? 'selected' : ''; ?>>
                    <?=$ciu->nombre?>
                </option>
            <?Php endwhile; ?>
        </select>

        <label class="frm" for="nombre">Nombre</label>
        <input type="text" name="nombre" value="<?=isset($tie) && is_object($tie) ? $tie->nombre : ''; ?>" required/>

        <label class="frm" for="direccion">Dirección</label>
        <input type="text" name="direccion" value="<?=isset($tie) && is_object($tie) ? $tie->direccion : ''; ?>" required/>
        
        <input type="submit" value="Guardar">

        <div class="fila-2">
            <a href="<?=base_url?>tienda/gestion" class="button extrae-colort">
                Regresar
            </a>
        </div>

    </form>