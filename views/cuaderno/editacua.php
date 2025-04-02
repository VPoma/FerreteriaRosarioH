<?Php if(isset($_SESSION['identity'])): ?>
    <?Php if(isset($edit) && isset($cua) && is_object($cua)):?>
        <h1>Edición de Datos de Registro de Nota de Venta - Cuaderno</h1>
        <?Php $url_action = base_url."cuaderno/updatecuaderno";?>
    <?Php endif;?>

    <form action="<?=$url_action?>" method="POST" enctype="multipart/form-data">

        <h3>Datos a EDITAR de la Nota de Venta N° <?=$cua->id_cua?></h3>

        <input type="hidden" name="id_cua" value="<?=$cua->id?>"/>

        <label class="frm" for="usuario">Usuario</label>
        <?Php $usuario = utils::showUsuario(); ?>
        <select name="usuario" id="">
            <?Php while($usu = $usuario->fetch_object()): ?>
                <option value="<?=$usu->id?>" <?=isset($cua) && is_object($cua) && $usu->id == $cua->id_usuario ? 'selected' : ''; ?>>
                    <?=$usu->nombre?> <?=$usu->apellidos?>
                </option>
            <?Php endwhile; ?>
        </select>

        <label class="frm" for="descripcion">Descripción</label>
        <input type="text" name="descripcion" value="<?=isset($cua) && is_object($cua) ? $cua->descripcion : ''; ?>" />
        
        <label class="frm"  for="situacion">Situación</label>
        <select name="situacion" id="opcion" onchange="actualizarEstado()">
            <option value="POR COBRAR" <?=isset($cua) && is_object($cua) && $cua->situacion == "POR COBRAR" ?  'selected' : ''; ?>>Por Cobrar - ORDEN</option>
            <option value="A CUENTA" <?=isset($cua) && is_object($cua) && $cua->situacion == "A CUENTA" ?  'selected' : ''; ?>>A cuenta</option>
            <option value="CANCELADO" <?=isset($cua) && is_object($cua) && $cua->situacion == "CANCELADO" ?  'selected' : ''; ?>>Cancelado</option>
        </select>

        <label class="frm" for="total">Monto Total</label>
        <input type="number" step="0.01" name="total" value="<?=isset($cua) && is_object($cua) ? $cua->total : ''; ?>" required/>

        <label class="frm" for="importe">Importe</label>
        <input type="number" step="0.01" name="importe" value="<?=isset($cua) && is_object($cua) ? $cua->importe : ''; ?>" required/>

        <label class="frm" for="resto">Resto</label>
        <input type="number" step="0.01" name="resto" value="<?=isset($cua) && is_object($cua) ? $cua->resto : ''; ?>" required/>

        <label class="frm" for="fecha">Fecha de Venta</label>
        <input type="date" name="fecha" value="<?=isset($cua) && is_object($cua) ? $cua->fecha : ''; ?>" required/>

        <?Php if(isset($cua->fecha_sal)):?>
            <label class="frm" for="fecha_sal">Fecha de Entrega de Productos</label>
            <input type="date" name="fecha_sal" value="<?=isset($cua) && is_object($cua) ? $cua->fecha_sal : ''; ?>" />
        <?Php endif;?>

        <br>
        <div class="fila-2">
            <input type="submit" value="Editar" class="button solide-colort" style="width:200px;">
        </div>
    </form>
    <br>
    <p><a href="<?=base_url?>cuaderno/detalle&id=<?=$cua->id?>" class="button extrae-colort" style="margin-left: 2%">Regresar</a></p>

    <?Php else: ?>
        <h1>Logueese Primero!!!</h1>
        <p>Necesitas estar logueado en la WEB para poder realizar tu Nota de Venta</p>
<?Php endif;?>