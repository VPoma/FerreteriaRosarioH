<?Php if(isset($edit) && isset($egr) && is_object($egr)):?>
    <h1>Editar Egreso: <?=$egr->descripcion?></h1>
    <?Php $url_action = base_url."egreso/save&id=".$egr->id;?>
<?Php else:?>
    <h1>Nuevo Egreso</h1>
    <?Php $url_action = base_url."egreso/save";?>
<?Php endif;?>

<form action="<?=$url_action?>" method="POST" enctype="multipart/form-data">

    <label class="frm" for="tienda">Tienda o Sucursal</label>
    <?Php $tiendas = utils::showTienda(); ?>
    <select name="tienda" id="">
        <?Php while($tie = $tiendas->fetch_object()): ?>
            <option value="<?=$tie->id?>" <?=isset($egr) && is_object($egr) && $tie->id == $egr->tienda ? 'selected' : ''; ?>>
                <?=$tie->nombre?>
            </option>
        <?Php endwhile; ?>
    </select>

    <input type="hidden" value="<?=$_SESSION['identity']->id?>" name="usuario"/>

    <label class="frm" for="descripcion">Descripción</label>
    <input type="text" name="descripcion" value="<?=isset($egr) && is_object($egr) ? $egr->descripcion : ''; ?>" required/>

    <label class="frm" for="tipopago">Tipo de Pago</label>
    <select name="tipopago" id="">
        <option value="EFECTIVO" <?=isset($egr) && is_object($egr) && $egr->tipopago == "EFECTIVO" ?  'selected' : ''; ?>> EFECTIVO</option>
        <option value="TRANSFERENCIA" <?=isset($egr) && is_object($egr) && $egr->tipopago == "TRANSFERENCIA" ?  'selected' : ''; ?>> TRANSFERENCIA</option>
    </select>

    <label class="frm" for="monto">Monto</label>
    <input type="number" step="any" name="monto" value="<?=isset($egr) && is_object($egr) ? $egr->monto : ''; ?>" required/>

    <input type="submit" value="Guardar">

    <div class="fila-2">
        <a href="<?=base_url?>egreso/gestion" class="button extrae-colort">
            Regresar
        </a>
    </div>

</form>