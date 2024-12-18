<?Php if(isset($edit) && isset($ciu) && is_object($ciu)):?>
    <h1>Editar Ciudad: <?=$ciu->nombre?></h1>
    <?Php $url_action = base_url."ciudad/save&id=".$ciu->id;?>
<?Php else:?>
    <h1>Crear Nueva Ciudad</h1>
    <?Php $url_action = base_url."ciudad/save";?>
<?Php endif;?>

    <form action="<?=$url_action?>" method="POST" enctype="multipart/form-data">

        <label class="frm" for="nombre">Nombre</label>
        <input type="text" name="nombre" value="<?=isset($ciu) && is_object($ciu) ? $ciu->nombre : ''; ?>" required/>
        
        <input type="submit" value="Guardar">

        <div class="fila-2">
            <a href="<?=base_url?>ciudad/gestion" class="button extrae-colort">
                Regresar
            </a>
        </div>

    </form>