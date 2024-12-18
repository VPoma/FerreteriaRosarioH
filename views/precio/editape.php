<?Php if(isset($edit) && isset($pre) && is_object($pre)):?>
    <h1>Editar Precio: <?=$pre->nombre?></h1>
    <?Php $url_action = base_url."precio/editprecio&id=".$pre->id;?>

    <form action="<?=$url_action?>" method="POST" enctype="multipart/form-data">

        <label class="frm">Linea de Producto</label>
        <label for="linea"><?=isset($pre) && is_object($pre) ? $pre->linea : ''; ?></label>

        <label class="frm">Marca de Producto</label>
        <label for="linea"><?=isset($pre) && is_object($pre) ? $pre->marca : ''; ?></label>

        <label class="frm" for="preciob">Precio Basico</label>
        <input type=number step=any name="preciob" value="<?=isset($pre) && is_object($pre) ? $pre->preciob : '0'; ?>" required/>

        <label class="frm" for="preciof">Precio Ferretera</label>
        <input type=number step=any name="preciof" value="<?=isset($pre) && is_object($pre) ? $pre->preciof : '0'; ?>" required/>

        <label class="frm" for="precioc">Precio Costo</label>
        <input type=number step=any name="precioc" value="<?=isset($pre) && is_object($pre) ? $pre->precioc : '0'; ?>" required/>
        
        <input type="submit" value="Guardar">

        <div class="fila-2">
            <a href="<?=base_url?>precio/tabla" class="button extrae-colort">
                Regresar
            </a>
        </div>

    </form>
<?Php endif;?>