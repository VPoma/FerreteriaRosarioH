<?Php if(isset($edit) && isset($usu) && is_object($usu)):?>
    <h1>Editar Usuario: <?=$usu->nombre?></h1>
    <?Php $url_action = base_url."usuario/save&id=".$usu->id;?>
<?Php else:?>
    <h1>Crear Nuevo Usuario</h1>
    <?Php $url_action = base_url."usuario/save";?>
<?Php endif;?>

    <form action="<?=$url_action?>" method="POST" enctype="multipart/form-data">

        <label class="frm" for="tienda">Tienda</label>
        <?Php $tiendas = utils::showTienda(); ?>
        <select name="tienda" id="">
            <?Php while($tie = $tiendas->fetch_object()): ?>
                <option value="<?=$tie->id?>" <?=isset($usu) && is_object($usu) && $tie->id == $usu->id_tienda ? 'selected' : ''; ?>>
                    <?=$tie->nombre?>
                </option>
            <?Php endwhile; ?>
        </select>

        <label class="frm" for="dni">DNI</label>
        <input type="number" name="dni" value="<?=isset($usu) && is_object($usu) ? $usu->dni : ''; ?>" required/>

        <label class="frm" for="nombre">Nombre</label>
        <input type="text" name="nombre" value="<?=isset($usu) && is_object($usu) ? $usu->nombre : ''; ?>" required/>

        <label class="frm" for="apellidos">Apellidos</label>
        <input type="text" name="apellidos" value="<?=isset($usu) && is_object($usu) ? $usu->apellidos : ''; ?>" required/>

        <label class="frm" for="usuariof">Usuario</label>
        <input type="text" name="usuariof" value="<?=isset($usu) && is_object($usu) ? $usu->usuariof : ''; ?>" required/>

        <label class="frm" for="password">Contraseña</label>
        <input type="password" name="password" value="<?=isset($usu) && is_object($usu) ? $usu->password : ''; ?>" required/>

        <label class="frm" for="rol">Tipo de Rol</label>
        <select name="rol" id="">
            <option value="user" <?=isset($usu) && is_object($usu) && $usu->rol == "user" ?  'selected' : ''; ?>> User</option>
            <option value="admin" <?=isset($usu) && is_object($usu) && $usu->rol == "admin" ?  'selected' : ''; ?>> Admin</option>
        </select>

        <label class="frm" for="imagen">Imágen</label>
        <div class="link2">
        <?Php if(isset($usu) && is_object($usu) && !empty($usu->imagen)): ?>
            <img class="tamaño_reg" src="<?=base_url?>uploads/images/<?=$usu->imagen?>" class="thumb"/>
        <?Php endif; ?>
        </div>
        <div class="link2">
            <input class="subeimg" type="file" name="imagen"/>  
        </div>
        
        <input type="submit" value="Guardar">

        <div class="fila-2">
            <a href="<?=base_url?>usuario/gestion" class="button extrae-colort">
                Regresar
            </a>
        </div>

    </form>