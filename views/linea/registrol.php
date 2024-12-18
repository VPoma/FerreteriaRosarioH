<?Php if(isset($edit) && isset($lin) && is_object($lin)):?>
    <h1>Editar Linea de Producto: <?=$lin->nombre?></h1>
    <?Php $url_action = base_url."linea/save&id=".$lin->id;?>
<?Php else:?>
    <h1>Crear Nueva Linea de Producto</h1>
    <?Php $url_action = base_url."linea/save";?>
<?Php endif;?>

    <form action="<?=$url_action?>" method="POST" enctype="multipart/form-data">

        <label class="frm" for="nombre">Nombre</label>
        <input type="text" name="nombre" value="<?=isset($lin) && is_object($lin) ? $lin->nombre : ''; ?>" required/>
        
        <input type="submit" value="Guardar">

        <div class="fila-2">
            <a href="<?=base_url?>linea/gestion" class="button extrae-colort">
                Regresar
            </a>
        </div>

    </form>