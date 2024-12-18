<?Php if(isset($edit) && isset($usu) && is_object($usu)):?>
    <h1>Edita tus Datos:</h1>
    <?Php $url_action = base_url."usuario/saveuser&id=".$usu->id;?>

    <form action="<?=$url_action?>" method="POST" enctype="multipart/form-data">

        <label class="frm" for="dni">DNI</label>
        <input type="number" name="dni" value="<?=isset($usu) && is_object($usu) ? $usu->dni : ''; ?>" required/>
    
        <label class="frm" for="nombre">Nombre</label>
        <input type="text" name="nombre" value="<?=isset($usu) && is_object($usu) ? $usu->nombre : ''; ?>" required/>

        <label class="frm" for="apellidos">Apellidos</label>
        <input type="text" name="apellidos" value="<?=isset($usu) && is_object($usu) ? $usu->apellidos : ''; ?>" required/>

        <label class="frm" for="usuariof">Usuario</label>
        <input type="text" name="usuariof" value="<?=isset($usu) && is_object($usu) ? $usu->usuariof : ''; ?>" required/>

        <label class="frm" for="imagen">Imágen</label>
        <div class="link2">
        <?Php if(isset($usu) && is_object($usu) && !empty($usu->imagen)): ?>
            <img class="tamaño_reg" src="<?=base_url?>uploads/images/<?=$usu->imagen?>" class="thumb"/>
        <?Php endif; ?>
        </div>
        <div class="link2">
            <input class="subeimg" type="file" name="imagen"/>  
        </div>

        <input type="submit" value="Guardar" class="button button-small">

        <div class="fila-2">
            <a href="<?=base_url?>usuario/logini" class="button extrae-colort">
                Regresar
            </a>
        </div>

    </form>

<?Php endif;?>
