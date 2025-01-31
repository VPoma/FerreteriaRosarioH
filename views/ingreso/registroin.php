<?Php if(isset($edit) && isset($ing) && is_object($ing)):?>
    <h1>Editar Ingreso: <?=$ing->descripcion?></h1>
    <?Php $url_action = base_url."ingreso/savein&id=".$ing->id;?>
<?Php else:?>
    <h1>Nuevo Ingreso</h1>
    <?Php $url_action = base_url."ingreso/savein";?>
<?Php endif;?>

<form action="<?=$url_action?>" method="POST" enctype="multipart/form-data">

    <label class="frm" for="tienda">Tienda o Sucursal</label>
    <?Php $tiendas = utils::showTienda(); ?>
    <select name="tienda" id="">
        <?Php while($tie = $tiendas->fetch_object()): ?>
            <option value="<?=$tie->id?>" <?=isset($ing) && is_object($ing) && $tie->id == $ing->tienda ? 'selected' : ''; ?>>
                <?=$tie->nombre?>
            </option>
        <?Php endwhile; ?>
    </select>

    <input type="hidden" value="<?=$_SESSION['identity']->id?>" name="usuario"/>

    <label class="frm" for="descripcion">Descripción</label>
    <input type="text" name="descripcion" value="<?=isset($ing) && is_object($ing) ? $ing->descripcion : ''; ?>" required/>

    <label class="frm" for="tipopago">Tipo de Pago</label>
    <select name="tipopago" id="">
        <option value="EFECTIVO" <?=isset($ing) && is_object($ing) && $ing->tipopago == "EFECTIVO" ?  'selected' : ''; ?>>EFECTIVO</option>
        <option value="YAPE" <?=isset($ing) && is_object($ing) && $ing->tipopago == "YAPE" ?  'selected' : ''; ?>>YAPE</option>
        <option value="BCP" <?=isset($ing) && is_object($ing) && $ing->tipopago == "BCP" ?  'selected' : ''; ?>>BCP</option>
        <option value="CAJA HUANCAYO" <?=isset($ing) && is_object($ing) && $ing->tipopago == "CAJA HUANCAYO" ?  'selected' : ''; ?>>CAJA HUANCAYO</option>
    </select>

    <label class="frm" for="monto">Monto</label>
    <input type="number" step="any" name="monto" value="<?=isset($ing) && is_object($ing) ? $ing->ingresos : ''; ?>" required/>

    <input type="submit" value="Guardar">

    <div class="fila-2">
        <a href="<?=base_url?>ingreso/gestion" class="button extrae-colort">
            Regresar
        </a>
    </div>

</form>