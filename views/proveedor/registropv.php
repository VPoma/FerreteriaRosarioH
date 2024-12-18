<?Php if(isset($edit) && isset($pvd) && is_object($pvd)):?>
    <h1>Editar Proveedor: <?=$pvd->nombrecom?></h1>
    <?Php $url_action = base_url."proveedor/save&id=".$pvd->id;?>
<?Php else:?>
    <h1>Registrar Nuevo Proveedor</h1>
    <?Php $url_action = base_url."proveedor/save";?>
<?Php endif;?>

<form action="<?=$url_action?>" method="POST" enctype="multipart/form-data">

    <label class="frm" for="numruc">Número de RUC</label>
    <input type="number" name="numruc" value="<?=isset($pvd) && is_object($pvd) ? $pvd->numruc : ''; ?>" required/>

    <label class="frm" for="nombrecom">Nombre del Proveedor</label>
    <input type="text" name="nombrecom" value="<?=isset($pvd) && is_object($pvd) ? $pvd->nombrecom : ''; ?>" required/>

    <label class="frm" for="direccion">Dirección</label>
    <input type="text" name="direccion" value="<?=isset($pvd) && is_object($pvd) ? $pvd->direccion : ''; ?>" required/>

    <label class="frm" for="ciudad">Ciudad</label>
    <?Php $ciudades = utils::showCiudad(); ?>
    <select name="ciudad" id="">
        <?Php while($ciu = $ciudades->fetch_object()): ?>
            <option value="<?=$ciu->id?>" <?=isset($pvd) && is_object($pvd) && $ciu->id == $pvd->id_ciudad ? 'selected' : ''; ?>>
                <?=$ciu->nombre?>
            </option>
        <?Php endwhile; ?>
    </select>

    <label class="frm" for="numcel">Número de Celular</label>
    <input type="number" name="numcel" value="<?=isset($pvd) && is_object($pvd) ? $pvd->numcel : ''; ?>" required/>
    
    <input type="submit" value="Guardar">

    <div class="fila-2">
        <a href="<?=base_url?>proveedor/gestion" class="button extrae-colort">
            Regresar
        </a>
    </div>

</form>