<?Php if(isset($edit) && isset($usu) && is_object($usu)):?>
    <h1>Cambia tu Contraseña</h1>
    <?Php $url_action = base_url."usuario/savepass&id=".$usu->id;?>

    <form action="<?=$url_action?>" method="POST" enctype="multipart/form-data">
    
        <label for="password">Password</label>
        <input type="password" name="password" value="<?=isset($usu) && is_object($usu) ? $usu->password : ''; ?>" required/>

        <input type="submit" value="Aceptar" class="button button-small">

        <div class="fila-2">
            <a href="<?=base_url?>usuario/logini" class="button extrae-colort">
                Regresar
            </a>
        </div>

    </form>

<?Php endif;?>
