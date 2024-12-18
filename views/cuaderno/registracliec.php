<form action="<?=base_url?>cuaderno/savecliente" method="POST" enctype="multipart/form-data">

    <label class="frm" for="tipodoc">Tipo de Documento</label>
    <?Php $tipodoc = utils::showTipodoc(); ?>
    <select name="tipodoc" id="">
        <?Php while($tp = $tipodoc->fetch_object()): ?>
            <option value="<?=$tp->id?>" <?=isset($cli) && is_object($cli) && $tp->id == $cli->id_tipodoc ? 'selected' : ''; ?>>
                <?=$tp->documento?>
            </option>
        <?Php endwhile; ?>
    </select>

    <label class="frm" for="numdoc">Número de Documento</label>
    <input type="number" name="numdoc" value="<?=isset($cli) && is_object($cli) ? $cli->numdoc : ''; ?>" required/>

    <label class="frm" for="nombrecom">Nombre del Cliente</label>
    <input type="text" name="nombrecom" value="<?=isset($cli) && is_object($cli) ? $cli->nombrecom : ''; ?>" required/>

    <label class="frm" for="direccion">Dirección</label>
    <input type="text" name="direccion" value="<?=isset($cli) && is_object($cli) ? $cli->direccion : ''; ?>" required/>

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
    
    <!--<input type="submit" value="Guardar">-->
    <!--<a href="<?=base_url?>cuaderno/eligcliente" class="button extrae-colort">
            Regresar
        </a>-->
    <br>
    <div class="fila-2">
        <!--<a href="<?=base_url?>cuaderno/eligcliente" class="button extrae-colort">
            Regresar
        </a>-->
        <input type="submit" value="Guardar" class="button solide-colort">
    </div>

    <br>
        <a href="<?=base_url?>cuaderno/eligcliente" class="button extrae-colort" style="margin-left: 2%">Regresar</a>
</form>