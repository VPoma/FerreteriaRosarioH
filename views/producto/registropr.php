<?Php if(isset($edit) && isset($pro) && is_object($pro)):?>
    <h1>Editar Producto: <?=$pro->nombre?></h1>
    <?Php $url_action = base_url."producto/save&id=".$pro->id;?>
<?Php else:?>
    <h1>Crear Nuevo Producto</h1>
    <?Php $url_action = base_url."producto/save";?>
<?Php endif;?>

    <form action="<?=$url_action?>" method="POST" enctype="multipart/form-data">

        <label class="frm" for="tienda">Tienda o Sucursal</label>
        <?Php $tiendas = utils::showTienda(); ?>
        <select name="tienda" id="">
            <?Php while($tie = $tiendas->fetch_object()): ?>
                <option value="<?=$tie->id?>" <?=isset($pro) && is_object($pro) && $tie->id == $pro->id_tienda ? 'selected' : ''; ?>>
                    <?=$tie->nombre?>
                </option>
            <?Php endwhile; ?>
        </select>

        <label class="frm" for="familia">Familia de Producto</label>
        <?Php $familias = utils::showFamilia(); ?>
        <select name="familia" id="">
            <?Php while($fam = $familias->fetch_object()): ?>
                <option value="<?=$fam->id?>" <?=isset($pro) && is_object($pro) && $fam->id == $pro->id_familia ? 'selected' : ''; ?>>
                    <?=$fam->nombre?>
                </option>
            <?Php endwhile; ?>
        </select>

        <label class="frm" for="linea">Linea de Producto</label>
        <?Php $lineas = utils::showLinea(); ?>
        <select name="linea" id="">
            <?Php while($lin = $lineas->fetch_object()): ?>
                <option value="<?=$lin->id?>" <?=isset($pro) && is_object($pro) && $lin->id == $pro->id_linea ? 'selected' : ''; ?>>
                    <?=$lin->nombre?>
                </option>
            <?Php endwhile; ?>
        </select>

        <label class="frm" for="marca">Marca de Producto</label>
        <?Php $marcas = utils::showMarca(); ?>
        <select name="marca" id="">
            <?Php while($mar = $marcas->fetch_object()): ?>
                <option value="<?=$mar->id?>" <?=isset($pro) && is_object($pro) && $mar->id == $pro->id_marca ? 'selected' : ''; ?>>
                    <?=$mar->nombre?>
                </option>
            <?Php endwhile; ?>
        </select>

        <label class="frm" for="nombre">Nombre de Producto</label>
        <input type="text" name="nombre" value="<?=isset($pro) && is_object($pro) ? $pro->nombre : ''; ?>" required/>

        <label class="frm" for="medida">Medida de Producto</label>
        <input type="text" name="medida" value="<?=isset($pro) && is_object($pro) ? $pro->medida : ''; ?>" required/>

        <label class="frm" for="cantidad">Cantidad Unidades</label>
        <input type="number" name="cantidad" value="<?=isset($pro) && is_object($pro) ? $pro->cantidad : ''; ?>" required/>

        <label class="frm" for="preciob">Precio Basico</label>
        <input type="number" step="any" name="preciob" value="<?=isset($pro) && is_object($pro) ? $pro->preciob : '0'; ?>" required/>

        <label class="frm" for="preciof">Precio Ferretera</label>
        <input type="number" step="any" name="preciof" value="<?=isset($pro) && is_object($pro) ? $pro->preciof : '0'; ?>" required/>

        <label class="frm" for="precioc">Precio Costo</label>
        <input type="number" step="any" name="precioc" value="<?=isset($pro) && is_object($pro) ? $pro->precioc : '0'; ?>" required/>

        <label class="frm" for="paquete">Paquete</label>
        <input type="number" name="paquete" value="<?=isset($pro) && is_object($pro) ? $pro->paquete : '0'; ?>" required/>

        <label class="frm" for="imagen">Imágen de Producto</label>
        <div class="link2">
        <?Php if(isset($pro) && is_object($pro) && !empty($pro->imagen)): ?>
            <img class="tamaño_reg" src="<?=base_url?>uploads/images/<?=$pro->imagen?>" class="thumb"/>
        <?Php endif; ?>
        </div>
        <div class="link2">
            <input class="subeimg" type="file" name="imagen"/>  
        </div>
        
        <input type="submit" value="Guardar">

        <div class="fila-2">
            <a href="<?=base_url?>producto/gestion" class="button extrae-colort">
                Regresar
            </a>
        </div>

    </form>