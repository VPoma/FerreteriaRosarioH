<form action="<?=base_url?>abastecer/saveprovee" method="POST" enctype="multipart/form-data">

    <label class="frm" for="ruc">Número de RUC</label>
    <input type="number" name="ruc" value="" required/>

    <label class="frm" for="nombrecom">Nombre del Proveedor</label>
    <input type="text" name="nombrecom" value="" required/>

    <label class="frm" for="direccion">Dirección</label>
    <input type="text" name="direccion" value="" required/>

    <label class="frm" for="ciudad">Ciudad</label>
    <?Php $ciudades = utils::showCiudad(); ?>
    <select name="ciudad" id="">
        <?Php while($ciu = $ciudades->fetch_object()): ?>
            <option value="<?=$ciu->id?>" <?=isset($cli) && is_object($cli) && $ciu->id == $cli->id_ciudad ? 'selected' : ''; ?>>
                <?=$ciu->nombre?>
            </option>
        <?Php endwhile; ?>
    </select>

    <label class="frm" for="numcel">Número de Celular</label>
    <input type="number" name="numcel" value="<?=isset($cli) && is_object($cli) ? $cli->numcel : ''; ?>" required/>
    
    <br>
    <div class="fila-2">

        <input type="submit" value="Guardar" class="button solide-colort">
    </div>

    <br>
        <a href="<?=base_url?>abastecer/eligprovee" class="button extrae-colort" style="margin-left: 2%">Regresar</a>
</form>