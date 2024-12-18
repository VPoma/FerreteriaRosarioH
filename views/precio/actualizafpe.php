<h1>Actualizar Precio de Fierros</h1>

<form action="<?=base_url?>precio/registrofierro" method="POST" enctype="multipart/form-data">

    <label class="frm" for="marca">Marca de Producto</label>
    <?Php $marcas = utils::showMarcaFi(); ?>
    <select name="marca" id="">
        <?Php while($mar = $marcas->fetch_object()): ?>
            <option value="<?=$mar->id?>">
                <?=$mar->nombre?>
            </option>
        <?Php endwhile; ?>
    </select>

    <label class="frm" for="tipocam">Tipo de Cambio</label>
    <input type=number step=any name="tipocam" value="" required/>

    <label class="frm" for="toneladab">Precio Tonelada Basico</label>
    <input type=number step=any name="toneladab" value="" required/>

    <label class="frm" for="toneladaf">Precio Tonelada Ferretera</label>
    <input type=number step="0.001" name="toneladaf" value="" required/>

    <label class="frm" for="toneladac">Precio Tonelada Costo</label>
    <input type=number step=any name="toneladac" value="" required/>

    <input type="submit" value="Actualizar">

    <div class="fila-2">
        <a href="<?=base_url?>precio/gestion" class="button extrae-colort">
            Regresar
        </a>
    </div>

</form>